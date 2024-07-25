from datetime import datetime, timedelta
import random
from flask import Blueprint, flash, jsonify, render_template, request, redirect, url_for
from flask_login import login_required, current_user
from .models import UserProgress, Lesson, Vocabulary, Question, Comment, Kanji
from . import db

views = Blueprint('views', __name__)

@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    return render_template("home.html", user=current_user)

@views.route('/tuvung-<level>', methods=['GET'])
@login_required
def vocabulary_by_level(level):
    level_map = {
        'n1': 1,
        'n2': 2,
        'n3': 3,
        'n4': 4,
        'n5': 5
    }
    level_id = level_map.get(level.lower())
    if level_id is None:
        return redirect(url_for('views.home'))
    lessons = Lesson.query.filter_by(level_id=level_id).all()
    return render_template('vocabulary_list.html', lessons=lessons, level=level)

@views.route('/kanji-<level>', methods=['GET'])
@login_required
def kanji_by_level(level):
    level_map = {
        'n1': 11,
        'n2': 12,
        'n3': 13,
        'n4': 14,
        'n5': 15
    }
    level_id = level_map.get(level.lower())
    if level_id is None:
        return redirect(url_for('views.home'))
    lessons = Lesson.query.filter_by(level_id=level_id).all()
    return render_template('kanji_list.html', lessons=lessons, level=level)

@views.route('/lesson/<int:lesson_id>/learn', methods=['GET', 'POST'])
@login_required
def lesson_vocabulary(lesson_id):
    lesson = Lesson.query.get_or_404(lesson_id)
    vocabulary_list = Vocabulary.query.filter_by(lesson_id=lesson_id).all()
    total_vocabularies = len(vocabulary_list)
    current_index = int(request.form.get('index', 0))

    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'next' and current_index < total_vocabularies - 1:
            current_index += 1
        elif action == 'prev' and current_index > 0:
            current_index -= 1
        elif action == 'add_comment':
            comment_content = request.form.get('comment_content')
            if comment_content:
                new_comment = Comment(
                    word_id=vocabulary_list[current_index].vocab_id,
                    id=current_user.id,
                    content=comment_content
                )
                db.session.add(new_comment)
                db.session.commit()
                return redirect(url_for('views.lesson_vocabulary', lesson_id=lesson_id, index=current_index))

    current_vocabulary = vocabulary_list[current_index] if total_vocabularies > 0 else None
    comments = Comment.query.filter_by(word_id=current_vocabulary.vocab_id).all() if current_vocabulary else []

    return render_template('lesson_vocabulary.html',
                           lesson=lesson,
                           current_vocabulary=current_vocabulary,
                           current_index=current_index,
                           total_vocabularies=total_vocabularies,
                           comments=comments)

@views.route('/kanjilesson/<int:lesson_id>/learn', methods=['GET', 'POST'])
@login_required
def lesson_kanji(lesson_id):
    lesson = Lesson.query.get_or_404(lesson_id)
    kanji_list = Kanji.query.filter_by(lesson_id=lesson_id).all()
    total_kanji = len(kanji_list)
    current_index = int(request.form.get('index', 0))

    if request.method == 'POST':
        action = request.form.get('action')
        if action == 'next' and current_index < total_kanji - 1:
            current_index += 1
        elif action == 'prev' and current_index > 0:
            current_index -= 1
        elif action == 'add_comment':
            comment_content = request.form.get('comment_content')
            if comment_content:
                new_comment = Comment(
                    kanji_id=kanji_list[current_index].kanji_id,
                    id=current_user.id,
                    content=comment_content
                )
                db.session.add(new_comment)
                db.session.commit()
                return redirect(url_for('views.lesson_kanji', lesson_id=lesson_id, index=current_index))

    current_kanji = kanji_list[current_index] if total_kanji > 0 else None
    comments = Comment.query.filter_by(kanji_id=current_kanji.kanji_id).all() if current_kanji else []

    return render_template('lesson_kanji.html',
                           lesson=lesson,
                           current_kanji=current_kanji,
                           current_index=current_index,
                           total_kanji=total_kanji,
                           comments=comments)

@views.route('/lesson/<int:lesson_id>/test', methods=['GET'])
@login_required
def take_test(lesson_id):
    # Lấy tất cả câu hỏi cho bài học cụ thể
    questions = Question.query.filter_by(lesson_id=lesson_id).all()
    
    # Đảo ngẫu nhiên thứ tự câu hỏi
    random.shuffle(questions)
    
    # Render trang kiểm tra với danh sách câu hỏi
    return render_template('test.html', questions=questions, lesson_id=lesson_id)

@views.route('/submit_test', methods=['POST'])
@login_required
def submit_test():
    lesson_id = request.form.get('lesson_id')
    current_time = datetime.now()

    # Tìm kiếm tiến trình học tập của người dùng
    user_progress = UserProgress.query.filter_by(id=current_user.id, lesson_id=lesson_id).first()

    # Cập nhật hoặc tạo mới tiến trình học tập
    if user_progress:
        user_progress.times_reviewed += 1
        user_progress.next_review = current_time + timedelta(minutes=user_progress.times_reviewed * 2)
    else:
        user_progress = UserProgress(
            id=current_user.id,
            lesson_id=lesson_id,
            times_reviewed=1,
            next_review=current_time + timedelta(minutes=1)
        )
        db.session.add(user_progress)

    db.session.commit()

    # Đếm số câu đúng
    correct_answers = sum(
        1 for question in Question.query.filter_by(lesson_id=lesson_id).all()
        if request.form.get(f'question_{question.question_id}') == question.correct_answer
    )
    
    total_questions = Question.query.filter_by(lesson_id=lesson_id).count()

    # Tính điểm
    score = f"{correct_answers}/{total_questions}"
    
    # Tính tỷ lệ phần trăm
    percentage = (correct_answers / total_questions) * 100 if total_questions > 0 else 0

    # Gửi thông báo cho người dùng
    message = ''
    if percentage >= 80:
        message = f'Wonderful! You passed the exam. Your score: {score}.'
    else:
        message = f'Bro! You\'re stupid. Your score: {score}.'
    
    flash(message, 'success' if percentage >= 80 else 'danger')

    # Chuyển hướng về trang chủ
    return redirect(url_for('views.home'))



@views.route('/update_progress/<int:user_id>', methods=['POST'])
@login_required
def update_progress(user_id):
    current_time = datetime.now()
    user_progresses = UserProgress.query.filter_by(id=user_id).all()
    notifications = []

    for progress in user_progresses:
        if current_time >= progress.next_review:
            notifications.append(f"{current_time.strftime('%Y-%m-%d %H:%M:%S')}: It's time to review lesson {progress.lesson_id}.")

    db.session.commit()
    return jsonify({"status": "success", "notifications": notifications})
