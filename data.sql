CREATE TABLE "UserProgress"(
    "progress_id" SERIAL,
    "id" INTEGER NULL,
    "lesson_id" INTEGER NULL,
    "times_reviewed" INTEGER NULL,
    "next_review" TIMESTAMP(0) WITHOUT TIME ZONE NULL
);
ALTER TABLE "UserProgress"
ADD PRIMARY KEY("progress_id");
CREATE TABLE "Vocabulary"(
    "vocab_id" INTEGER NOT NULL,
    "lesson_id" INTEGER NULL,
    "hiragana" TEXT NOT NULL,
    "word" VARCHAR(50) NOT NULL,
    "meaning" TEXT NOT NULL,
    "example_sentence" TEXT NULL
);
ALTER TABLE "Vocabulary"
ADD PRIMARY KEY("vocab_id");
CREATE TABLE "Lesson"(
    "lesson_id" INTEGER NOT NULL,
    "level_id" INTEGER NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT NULL
);
ALTER TABLE "Lesson"
ADD PRIMARY KEY("lesson_id");
CREATE TABLE "Question"(
    "question_id" INTEGER NOT NULL,
    "lesson_id" INTEGER NOT NULL,
    "type" INTEGER NOT NULL,
    "question_content" TEXT NOT NULL,
    "option_1" TEXT NOT NULL,
    "option_2" TEXT NOT NULL,
    "option_3" TEXT NOT NULL,
    "option_4" TEXT NOT NULL,
    "correct_answer" TEXT NOT NULL
);
ALTER TABLE "Question"
ADD PRIMARY KEY("question_id");
CREATE TABLE "User"(
    "id" SERIAL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    "name" VARCHAR(100) NULL,
    "dob" DATE NULL
);
ALTER TABLE "User"
ADD PRIMARY KEY("id");
CREATE TABLE "Kanji"(
    "kanji_id" BIGINT NOT NULL,
    "lesson_id" BIGINT NOT NULL,
    "kanji" VARCHAR(20) NOT NULL,
    "photo" TEXT NOT NULL,
    "on" TEXT NOT NULL,
    "kun" TEXT NOT NULL,
    "meaning" TEXT NOT NULL,
    "example_sentence" TEXT NOT NULL
);
ALTER TABLE "Kanji"
ADD PRIMARY KEY("kanji_id");
CREATE TABLE "Comment"(
    "comment_id" INTEGER NOT NULL,
    "word_id" INTEGER NULL,
    "id" INTEGER NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL DEFAULT CURRENT_TIMESTAMP,
    "kanji_id" INTEGER NULL
);
ALTER TABLE "Comment"
ADD PRIMARY KEY("comment_id");
ALTER TABLE "UserProgress"
ADD CONSTRAINT "userprogress_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Vocabulary"
ADD CONSTRAINT "vocabulary_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_word_id_foreign_vocab" FOREIGN KEY("word_id") REFERENCES "Vocabulary"("vocab_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_id_foreign" FOREIGN KEY("id") REFERENCES "User"("id");
ALTER TABLE "Question"
ADD CONSTRAINT "question_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "Comment"
ADD CONSTRAINT "comment_kanji_id_foreign_kanji" FOREIGN KEY("kanji_id") REFERENCES "Kanji"("kanji_id");
ALTER TABLE "Kanji"
ADD CONSTRAINT "kanji_lesson_id_foreign" FOREIGN KEY("lesson_id") REFERENCES "Lesson"("lesson_id");
ALTER TABLE "UserProgress"
ADD CONSTRAINT "userprogress_id_foreign" FOREIGN KEY("id") REFERENCES "User"("id");
CREATE TABLE "Todo" (
    "todo_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "completed" BOOLEAN DEFAULT FALSE,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE "Todo"
ADD CONSTRAINT "todo_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "User"("id");
INSERT INTO "Lesson" (lesson_id, level_id, title, description) VALUES
(1,5,'Lesson 1','Minna No Nihongo 1'),
(2,5,'Lesson 2','Minna No Nihongo 1'),
(3,5,'Lesson 3','Minna No Nihongo 1'),
(26,4,'Lesson 26','Minna No Nihongo 2'),
(27,4,'Lesson 27','Minna No Nihongo 2'),
(28,4,'Lesson 28','Minna No Nihongo 2'),
(29,4,'Lesson 29','Minna No Nihongo 2');

INSERT INTO "Lesson" (lesson_id, level_id, title, description) VALUES
(51,3,'Lesson 51','Mimikara Oboeru Goi N3'),
(52,3,'Lesson 52','Mimikara Oboeru Goi N3'),
(53,3,'Lesson 53','Mimikara Oboeru Goi N3'),
(54,3,'Lesson 54','Mimikara Oboeru Goi N3'),
(55,3,'Lesson 55','Mimikara Oboeru Goi N3'),
(56,3,'Lesson 56','Mimikara Oboeru Goi N3'),
(57,3,'Lesson 57','Mimikara Oboeru Goi N3'),
(58,3,'Lesson 58','Mimikara Oboeru Goi N3');

INSERT INTO "Lesson" (lesson_id, level_id, title, description) VALUES
(59,2,'Lesson 59','Mimikara Oboeru Goi N2'),
(60,2,'Lesson 60','Mimikara Oboeru Goi N2'),
(61,2,'Lesson 61','Mimikara Oboeru Goi N2'),
(62,2,'Lesson 62','Mimikara Oboeru Goi N2'),
(63,2,'Lesson 63','Mimikara Oboeru Goi N2'),
(64,2,'Lesson 64','Mimikara Oboeru Goi N2'),
(65,2,'Lesson 65','Mimikara Oboeru Goi N2'),
(66,2,'Lesson 66','Mimikara Oboeru Goi N2'),
(67,2,'Lesson 67','Mimikara Oboeru Goi N2'),
(68,2,'Lesson 68','Mimikara Oboeru Goi N2'),
(69,2,'Lesson 69','Mimikara Oboeru Goi N2'),
(70,2,'Lesson 70','Mimikara Oboeru Goi N2'),
(71,2,'Lesson 71','Mimikara Oboeru Goi N2'),
(72,2,'Lesson 72','Mimikara Oboeru Goi N2');
INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence) VALUES
(1, 1, 'わたし', '私', 'Tôi', 'わたしはがくせいです。(Tôi là học sinh.)'),
(2, 1, 'あなた', '貴方', 'Bạn', 'あなたはどこから来ましたか？(Bạn đến từ đâu?)'),
(3, 1, 'ノート', 'ノート', 'Vở, notebook', 'ノートを持っていますか？(Bạn có mang vở không?)'),
(4, 1, 'めいし', '名刺', 'Danh thiếp', 'これはわたしのめいしです。(Đây là danh thiếp của tôi.)'),
(5, 1, 'ボールペン', 'ボールペン', 'Bút bi', 'ボールペンを貸してください。(Xin cho mượn bút bi.)'),
(6, 1, 'えんぴつ', '鉛筆', 'Bút chì', 'えんぴつで書きます。(Viết bằng bút chì.)'),
(7, 1, 'つくえ', '机', 'Bàn', 'つくえの上に本があります。(Có quyển sách trên bàn.)'),
(8, 1, 'きょうしつ', '教室', 'Lớp học', 'きょうしつで勉強します。(Học trong lớp học.)'),
(9, 1, 'あさ', '朝', 'Buổi sáng', 'あさごはんを食べます。(Ăn sáng.)'),
(10, 1, 'いきます', '行きます', 'Đi', '学校にいきます。(Đi đến trường.)'),
(11, 2, 'かんたん', '簡単', 'Đơn giản', 'この問題はかんたんです。(Vấn đề này đơn giản.)'),
(12, 2, 'ちかい', '近い', 'Gần', '駅がちかいです。(Ga gần.)'),
(13, 2, 'とおい', '遠い', 'Xa', '学校はとおいです。(Trường xa.)'),
(14, 2, 'はやい', '早い', 'Nhanh, sớm', '電車ははやいです。(Tàu nhanh.)'),
(15, 2, 'おそい', '遅い', 'Chậm, muộn', 'バスはおそいです。(Xe buýt chậm.)'),
(16, 2, 'おおい', '多い', 'Nhiều', '宿題がおおいです。(Bài tập nhiều.)'),
(17, 2, 'すくない', '少ない', 'Ít', '人がすくないです。(Ít người.)'),
(18, 2, 'あたたかい', '暖かい', 'Ấm áp', '今日はあたたかいです。(Hôm nay ấm áp.)'),
(19, 2, 'すずしい', '涼しい', 'Mát mẻ', 'すずしい風が吹きます。(Gió mát thổi.)'),
(20, 2, 'あまい', '甘い', 'Ngọt', 'このケーキはあまいです。(Bánh này ngọt.)'),
(21, 3, 'からい', '辛い', 'Cay', 'カレーがからいです。(Cà ri cay.)'),
(22, 3, 'おもい', '重い', 'Nặng', 'このかばんはおもいです。(Cặp này nặng.)'),
(23, 3, 'かるい', '軽い', 'Nhẹ', 'かるい荷物です。(Hành lý nhẹ.)'),
(24, 3, 'いい', '良い', 'Tốt', 'いい天気です。(Thời tiết tốt.)'),
(25, 3, 'きせつ', '季節', 'Mùa', '日本のきせつ。(Mùa của Nhật Bản.)'),
(26, 3, 'はる', '春', 'Mùa xuân', 'はるが好きです。(Thích mùa xuân.)'),
(27, 3, 'なつ', '夏', 'Mùa hè', 'なつは暑いです。(Mùa hè nóng.)'),
(28, 3, 'あき', '秋', 'Mùa thu', 'あきは涼しいです。(Mùa thu mát.)'),
(29, 3, 'ふゆ', '冬', 'Mùa đông', 'ふゆは寒いです。(Mùa đông lạnh.)'),
(713, 26, 'みます', '見ます、診ます', 'Kiểm tra, khám bệnh', '医者がみます。(Bác sĩ khám bệnh.)'),
(719, 26, 'ひろいます', '拾います', 'Nhặt, lượm', '道でお金をひろいます。(Nhặt tiền trên đường.)'),
(720, 26, 'れんらくします', '連絡します', 'Liên lạc', '友達にれんらくします。(Liên lạc với bạn bè.)'),
(721, 26, 'きぶんがいい', '気分がいい', 'Cảm thấy thoải mái, cảm thấy khỏe', '今日はきぶんがいいです。(Hôm nay cảm thấy thoải mái.)'),
(722, 26, 'きぶんがわるい', '気分が悪い', 'Cảm thấy không thoải mái, cảm thấy mệt', 'きぶんがわるいです。(Cảm thấy không thoải mái.)'),
(723, 26, 'うんどうかい', '運動会', 'Hội thi thể thao', '学校でうんどうかいがあります。(Có hội thi thể thao ở trường.)'),
(724, 27, 'かいます', '飼います', 'Nuôi', '犬をかいます。(Nuôi chó.)'),
(725, 27, 'しんぱい［な］', '心配［な］', 'Lo lắng', 'テストがしんぱいです。(Lo lắng về bài kiểm tra.)'),
(726, 27, 'ペット', 'ペット', 'Thú cưng, động vật nuôi', 'ペットをかっています。(Nuôi thú cưng.)'),
(727, 27, 'とり', '鳥', 'Chim', 'とりが鳴いています。(Chim đang hót.)'),
(728, 27, 'こえ', '声', 'Tiếng', '美しいこえです。(Giọng nói đẹp.)'),
(729, 27, 'なみ', '波', 'Sóng', '海のなみ。(Sóng biển.)'),
(730, 27, 'はなび', '花火', 'Pháo hoa', '花火を見ます。(Xem pháo hoa.)'),
(731, 27, 'どうぐ', '道具', 'Dụng cụ', '料理のどうぐ。(Dụng cụ nấu ăn.)'),
(732, 27, 'クリーニング', 'クリーニング', 'Giặt là', 'クリーニング店に行きます。(Đi đến cửa hàng giặt là.)'),
(733, 27, 'いえ', '家', 'Nhà', '私のいえ。(Nhà của tôi.)'),
(734, 27, 'マンション', 'マンション', 'Chung cư', '新しいマンション。(Chung cư mới.)'),
(735, 28, 'ねっしん［な］', '熱心［な］', 'Nhiệt tình', 'ねっしんに勉強します。(Học hành nhiệt tình.)'),
(736, 28, 'えらい', '偉い', 'Siêu, giỏi', '彼はえらい人です。(Anh ấy là người giỏi.)'),
(737, 28, 'ちょうどいい', 'ちょうどいい', 'Vừa vặn', 'ちょうどいいサイズです。(Kích thước vừa vặn.)'),
(738, 28, 'けしき', '景色', 'Phong cảnh', '美しいけしき。(Phong cảnh đẹp.)'),
(739, 28, 'びよういん', '美容院', 'Hiệu làm đẹp', 'びよういんに行きます。(Đi đến hiệu làm đẹp.)'),
(740, 28, 'だいどころ', '台所', 'Nhà bếp', 'だいどころで料理します。(Nấu ăn trong nhà bếp.)'),
(741, 28, 'けいけん', '経験', 'Kinh nghiệm', '豊富なけいけん。(Kinh nghiệm phong phú.)'),
(742, 28, 'ちから', '力', 'Sức mạnh', '大きなちから。(Sức mạnh lớn.)'),
(743, 28, 'にんき', '人気', 'Được yêu thích', '[がくせいに]～があります: Được [sinh viên] yêu thích'),
(744, 28, 'かたち', '形', 'Hình dáng', 'いろいろなかたち。(Các loại hình dáng.)'),
(745, 28, 'いろ', '色', 'Màu sắc', '美しいいろ。(Màu sắc đẹp.)'),
(746, 28, 'あじ', '味', 'Vị', 'おいしいあじ。(Vị ngon.)'),
(747, 28, 'ガム', 'ガム', 'Kẹo cao su', 'ガムを噛みます。(Nhai kẹo cao su.)'),
(748, 28, 'しなもの', '品物', 'Hàng hóa', '新しいしなもの。(Hàng hóa mới.)'),
(749, 28, 'ねだん', '値段', 'Giá cả', 'ねだんが高いです。(Giá cao.)'),
(750, 29, '～がわ', '～側', 'Phía ~', '右がわ。(Phía bên phải.)'),
(751, 29, 'ポケット', 'ポケット', 'Túi', 'ポケットに入れます。(Bỏ vào túi.)'),
(752, 29, '～へん', '～辺', 'Chỗ ~', 'このへん。(Chỗ này.)'),
(753, 29, 'おぼえていません', '覚えていません', 'Tôi không nhớ.', '私はおぼえていません。(Tôi không nhớ.)'),
(754, 29, 'あみだな', '網棚', 'Giá để hành lý', '電車のあみだな。(Giá để hành lý trên tàu.)'),
(755, 29, 'たしか', '確か', 'Chắc là', 'たしかにそうです。(Chắc là như vậy.)'),
(756, 29, '[ああ、]よかった', '[ああ、]よかった', '[Ôi,] tốt quá.', '[ああ、]よかったです。(Ôi, tốt quá.)'),
(757, 29, 'しんじゅく', '新宿', 'Tên một địa điểm/nhà ga ở Tokyo', 'しんじゅくに行きます。(Đi đến Shinjuku.)');




    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3000, 51, 'だんせい', '男性', 'đàn ông', 'その男性はとても親切でした。(Người đàn ông đó rất tốt bụng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3001, 51, 'じょせい', '女性', 'phụ nữ', '彼女は美しい女性です。(Cô ấy là một phụ nữ đẹp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3002, 51, 'こうれい', '高齢', 'cao tuổi', '高齢者には特別な配慮が必要です。(Người cao tuổi cần được quan tâm đặc biệt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3003, 51, 'としうえ', '年上', 'hơn tuổi', '彼は年上の友達が多いです。(Anh ấy có nhiều bạn lớn tuổi hơn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3004, 51, 'めうえ', '目上', 'bề trên', '目上の人には敬意を払うべきです。(Nên tôn trọng những người bề trên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3005, 51, 'せんぱい', '先輩', 'tiền bối', '先輩がたくさんアドバイスをくれました。(Tiền bối đã cho tôi rất nhiều lời khuyên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3006, 51, 'こうはい', '後輩', 'hậu bối', '後輩たちと一緒にプロジェクトを進めています。(Tôi đang tiến hành dự án cùng với các hậu bối.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3007, 51, 'じょうし', '上司', 'cấp trên', '上司は会議で重要な発表をしました。(Sếp đã đưa ra thông báo quan trọng trong cuộc họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3008, 51, 'あいて', '相手', 'người đối diện', '相手の意見を尊重しましょう。(Hãy tôn trọng ý kiến của đối phương.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3009, 51, 'しりあい', '知り合い', 'người quen', '知り合いに久しぶりに会いました。(Tôi đã gặp lại người quen sau một thời gian dài.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3010, 51, 'ゆうじん', '友人', 'bạn bè', '彼は友人としてとても信頼できます。(Anh ấy rất đáng tin cậy như một người bạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3011, 51, 'なか', '仲', 'mối quan hệ', '二人の仲はとても良いです。(Mối quan hệ giữa hai người rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3012, 51, 'せいねんがっぴ', '生年月日', 'ngày tháng năm sinh', '彼の生年月日は1985年5月1日です。(Ngày sinh của anh ấy là ngày 1 tháng 5 năm 1985.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3013, 51, 'たんじょう', '誕生', 'ra đời', '赤ちゃんの誕生を祝います。(Chúc mừng sự ra đời của em bé.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3014, 51, 'とし', '年', 'năm', '今年は特別な年になるでしょう。(Năm nay sẽ là một năm đặc biệt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3015, 51, 'しゅっしん', '出身', 'quê quán', '彼は東京出身です。(Anh ấy quê ở Tokyo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3016, 51, 'こきょう', '故郷', 'cố hương', '故郷に帰りたいです。(Tôi muốn trở về cố hương.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3017, 51, 'せいちょう', '成長', 'trưởng thành', '彼の成長は驚くべきものです。(Sự trưởng thành của anh ấy thật đáng ngạc nhiên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3018, 51, 'せいじん', '成人', 'người trưởng thành', '彼は成人してから家を出ました。(Anh ấy đã ra khỏi nhà sau khi trở thành người trưởng thành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3019, 51, 'ごうかく', '合格', 'đỗ đại học', '試験に合格しました。(Tôi đã đỗ kỳ thi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3020, 51, 'しんがく', '進学', 'vào đại học', '彼は大学に進学しました。(Anh ấy đã vào đại học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3021, 51, 'たいがく', '退学', 'bỏ học', '学校を退学しました。(Tôi đã bỏ học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3022, 51, 'しゅうしょく', '就職', 'có việc làm', '就職活動がうまくいきました。(Việc tìm việc của tôi đã thành công.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3023, 51, 'たいしょく', '退職', 'nghỉ việc', '会社を退職しました。(Tôi đã nghỉ việc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3024, 51, 'しつぎょう', '失業', 'thất nghiệp', '失業期間が長くなりました。(Thời gian thất nghiệp đã kéo dài.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3025, 51, 'ざんぎょう', '残業', 'làm thêm', '毎日残業しています。(Tôi làm thêm giờ mỗi ngày.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3026, 51, 'せいかつ', '生活', 'cuộc sống', '新しい生活が始まりました。(Một cuộc sống mới đã bắt đầu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3027, 51, 'つうきん', '通勤', 'đi làm', '毎朝通勤が大変です。(Đi làm mỗi sáng thật vất vả.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3028, 51, 'がくれき', '学歴', 'bằng cấp', '彼は高学歴です。(Anh ấy có học vấn cao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3029, 51, 'きゅうりょう', '給料', 'tiền lương', '給料が上がりました。(Lương của tôi đã tăng lên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3030, 51, 'めんせつ', '面接', 'phỏng vấn', '面接の結果が良かったです。(Kết quả của buổi phỏng vấn rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3031, 51, 'きゅうけい', '休憩', 'nghỉ ngơi', '短い休憩を取りました。(Tôi đã nghỉ ngơi một chút.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3032, 51, 'かんこう', '観光', 'tham quan', '京都を観光しました。(Tôi đã tham quan Kyoto.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3033, 51, 'きこく', '帰国', 'về nước', '来月帰国します。(Tôi sẽ về nước vào tháng tới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3034, 51, 'きせい', '帰省', 'về quê', '夏休みに帰省します。(Tôi sẽ về quê vào kỳ nghỉ hè.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3035, 51, 'きたく', '帰宅', 'về nhà', '仕事の後、帰宅します。(Sau công việc, tôi về nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3036, 51, 'さんか', '参加', 'tham gia', '彼はそのイベントに参加しました。(Anh ấy đã tham gia sự kiện đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3037, 51, 'しゅっせき', '出席', 'có mặt', '彼女は会議に出席しました。(Cô ấy đã có mặt tại cuộc họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3038, 51, 'けっせき', '欠席', 'vắng mặt', '欠席者が多かったです。(Có nhiều người vắng mặt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3039, 51, 'ちこく', '遅刻', 'đến muộn', '授業に遅刻しました。(Tôi đã đến muộn lớp học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3040, 51, 'けしょう', '化粧', 'trang điểm', '毎朝化粧をします。(Tôi trang điểm mỗi sáng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3041, 51, 'けいさん', '計算', 'tính toán', '計算が得意です。(Tôi giỏi tính toán.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3042, 51, 'けいかく', '計画', 'kế hoạch', '旅行の計画を立てています。(Tôi đang lập kế hoạch cho chuyến du lịch.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3043, 51, 'せいこう', '成功', 'thành công', 'プロジェクトが成功しました。(Dự án đã thành công.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3044, 51, 'しっぱい', '失敗', 'thất bại', '試験に失敗しました。(Tôi đã thất bại trong kỳ thi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3045, 51, 'じゅんび', '準備', 'chuẩn bị', 'イベントの準備をしています。(Tôi đang chuẩn bị cho sự kiện.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3046, 51, 'せいり', '整理', 'chỉnh sửa', '部屋を整理しました。(Tôi đã chỉnh sửa lại căn phòng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3047, 51, 'ちゅうもん', '注文', 'đặt hàng', '新しい本を注文しました。(Tôi đã đặt mua một cuốn sách mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3048, 51, 'ちょきん', '貯金', 'tiết kiệm', '毎月少しずつ貯金しています。(Tôi tiết kiệm một chút mỗi tháng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3049, 51, 'てつや', '徹夜', 'thức xuyên đêm', '徹夜で勉強しました。(Tôi đã học suốt đêm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3050, 51, 'ひっこし', '引っ越し', 'chuyển nhà', '新しい家に引っ越しました。(Tôi đã chuyển đến ngôi nhà mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3051, 51, 'しんちょう', '身長', 'chiều cao', '彼の身長は180センチです。(Chiều cao của anh ấy là 180 cm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3052, 51, 'たいじゅう', '体重', 'cân nặng', '体重が増えました。(Tôi đã tăng cân.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3053, 51, 'けが', 'けが', 'vết thương', 'その事故でけがをしました。(Tôi bị thương trong tai nạn đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3054, 51, 'かい', '会', 'hội, tiệc', '友達と会を開きました。(Tôi đã tổ chức một buổi gặp mặt với bạn bè.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3055, 51, 'しゅみ', '趣味', 'sở thích', '趣味は読書です。(Sở thích của tôi là đọc sách.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3056, 51, 'きょうみ', '興味', 'hứng thú', '彼は歴史に興味があります。(Anh ấy quan tâm đến lịch sử.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3057, 51, 'おもいで', '思い出', 'nhớ lại', '学生時代の思い出がたくさんあります。(Tôi có nhiều kỷ niệm thời học sinh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3058, 51, 'じょうだん', '冗談', 'đùa cợt', '彼の冗談は面白いです。(Câu đùa của anh ấy rất vui.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3059, 51, 'もくてき', '目的', 'mục đích', '目的を達成しました。(Tôi đã đạt được mục đích.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3060, 51, 'やくそく', '約束', 'lời hứa', '彼と約束をしました。(Tôi đã hứa với anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3061, 51, 'おしゃべり', 'おしゃべり', 'nói chuyện riêng', '授業中におしゃべりをしてはいけません。(Không được nói chuyện riêng trong giờ học.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3062, 51, 'えんりょ', '遠慮', 'ngại ngần', '遠慮しないでください。(Đừng ngại ngùng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3063, 51, 'がまん', '我慢', 'chịu đựng', '痛みを我慢しています。(Tôi đang chịu đựng cơn đau.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3064, 51, 'めわく', '目枠', 'làm phiền', '目標を達成しました。(Tôi đã đạt được mục tiêu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3065, 51, 'きぼう', '希望', 'hi vọng', '希望を持っています。(Tôi có hy vọng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3066, 51, 'ゆめ', '夢', 'giấc mơ', '夢が叶いました。(Giấc mơ đã trở thành hiện thực.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3067, 51, 'さんせい', '賛成', 'đồng ý', '彼の意見に賛成です。(Tôi đồng ý với ý kiến của anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3068, 51, 'はんたい', '反対', 'đối lập', 'その提案には反対です。(Tôi phản đối đề xuất đó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3069, 51, 'そうぞう', '創造', 'tưởng tượng', '新しいアイデアを創造しました。(Tôi đã sáng tạo ra một ý tưởng mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3070, 51, 'どりょく', '努力', 'nỗ lực', '彼は努力家です。(Anh ấy là một người nỗ lực.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3071, 51, 'たいよう', '太陽', 'mặt trời', '太陽が昇ります。(Mặt trời mọc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3072, 51, 'ちきゅう', '地球', 'trái đất', '地球は丸いです。(Trái đất hình tròn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3073, 51, 'おんど', '温度', 'nhiệt độ', '今日は温度が高いです。(Hôm nay nhiệt độ cao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3074, 51, 'しつど', '湿度', 'độ ẩm', '湿度が高くて蒸し暑いです。(Độ ẩm cao và oi bức.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3075, 51, 'しっけ', '湿気', 'hơi ẩm', '梅雨が始まりました。(Mùa mưa đã bắt đầu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3076, 51, 'つゆ', '梅雨', 'mùa mưa', 'パンにかびが生えました。(Bánh mì đã bị mốc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3077, 51, 'かび', 'かび', 'nấm mốc', '冬は暖房が必要です。(Mùa đông cần có lò sưởi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3078, 51, 'だんぼう', '暖房', 'điều hòa ấm', 'リンゴの皮をむきます。(Tôi gọt vỏ táo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3079, 51, 'かわ', '皮', 'da', '魚を館で料理します。(Tôi nấu cá trong nhà bếp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3080, 51, 'かん', '館', 'can', 'テレビの画面が大きいです。(Màn hình TV rất lớn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3081, 51, 'がめん', '画面', 'màn hình', '好きな番組を見ます。(Tôi xem chương trình yêu thích.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3082, 51, 'ばんぐみ', '番組', 'chương trình', '新聞の記事を読みます。(Tôi đọc bài báo trên báo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3083, 51, 'きじ', '記事', 'ký sự', '近所の公園へ行きます。(Tôi đi đến công viên gần nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3084, 51, 'きんじょ', '近所', 'xung quanh', '警察に助けを求めます。(Tôi nhờ cảnh sát giúp đỡ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3085, 51, 'けいさつ', '警察', 'cảnh sát', '犯人が捕まりました。(Kẻ phạm tội đã bị bắt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3086, 51, 'はんにん', '犯人', 'tội phạm', '財布に小銭がたくさんあります。(Trong ví có nhiều tiền lẻ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3087, 51, 'こぜに', '小銭', 'tiền lẻ', '母がごちそうを作りました。(Mẹ đã nấu một bữa tiệc thịnh soạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3088, 51, 'ごちそう', 'ごちそう', 'chiêu đãi', '彼は有名な作者です。(Anh ấy là một tác giả nổi tiếng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3089, 51, '作者', '作者', 'tác giả', 'その作品は素晴らしいです。(Tác phẩm đó thật tuyệt vời.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3090, 51, 'さくひん', '作品', 'tác phẩm', '学校で制服を着ます。(Tôi mặc đồng phục ở trường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3091, 51, 'せいふく', '制服', 'đồng phục', '洗剤で食器を洗います。(Tôi rửa chén bát bằng nước rửa chén.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3092, 51, 'せんざい', '洗剤', 'bột giặt', '靴の底が汚れています。(Đế giày bị bẩn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3093, 51, 'そこ', '底', 'đáy', '地下鉄に乗ります。(Tôi đi tàu điện ngầm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3094, 51, 'ちか', '地下', 'ngầm', 'お寺を訪れます。(Tôi thăm chùa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3095, 51, 'てら', '寺', 'chùa', '道路が混んでいます。(Đường phố đang tắc nghẽn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3096, 51, 'どうろ', '道路', 'đường', '坂を上ります。(Tôi leo lên đồi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3097, 51, 'さか', '坂', 'dốc', 'タバコの煙が嫌いです。(Tôi ghét khói thuốc lá.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3098, 51, 'けむり', '煙', 'khói', '灰を捨てます。(Tôi đổ tro.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3099, 51, 'はい', '灰', 'tàn', '会社の判を押します。(Tôi đóng dấu công ty.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3100, 51, 'はん', '判', 'con dấu', '名刺を交換します。(Tôi trao đổi danh thiếp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3101, 51, 'めいし', '名刺', 'danh thiếp', '運転免許を取りました。(Tôi đã lấy được bằng lái xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3102, 51, 'めんきょ', '免許', 'giấy phép', '多くの人が参加しました。(Nhiều người đã tham gia.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3103, 51, 'おおく', '多く', 'nhiều', '試合の前半は良かったです。(Hiệp đầu của trận đấu rất tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3104, 51, 'ぜんはん', '前半', 'phần đầu', '試合の後半に点を取られました。(Chúng tôi đã bị ghi bàn trong hiệp hai.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3105, 51, 'こうはん', '後半', 'phần cuối', '最高の結果を出しました。(Tôi đã đạt kết quả tốt nhất.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3106, 51, 'さいこう', '最高', 'cao nhất', '最低の点数を取りました。(Tôi đã đạt điểm thấp nhất.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3107, 51, 'さいてい', '最低', 'thấp nhất', '最初に挨拶をします。(Tôi chào hỏi đầu tiên.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3108, 51, 'さいしょ', '最初', 'đầu tiên', '最後まで頑張ります。(Tôi sẽ cố gắng đến cùng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3109, 51, 'さいご', '最後', 'cuối cùng', 'このドアは自動で開きます。(Cửa này mở tự động.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3110, 51, 'じどう', '自動', 'tự động', '色々な種類の花があります。(Có nhiều loại hoa khác nhau.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3111, 51, 'しゅるい', '種類', 'loại', '彼は性格が良いです。(Anh ấy có tính cách tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3112, 51, 'せいかく', '性格', 'tính cách', '金は金属の一種です。(Vàng là một loại kim loại.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3113, 51, 'せいしつ', '性質', 'tính chất', '順番を待ちます。(Tôi chờ đến lượt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3114, 51, 'じゅんばん', '順番', 'thứ tự', '次は私の番です。(Lần tới là lượt của tôi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3115, 51, 'ばん', '番', 'lượt', '彼の方法は正しいです。(Phương pháp của anh ấy là đúng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3116, 51, 'ほうほう', '方法', 'phương pháp', '新しい製品が発売されました。(Sản phẩm mới đã được phát hành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3117, 51, 'せいひん', '製品', 'sản phẩm', '値上がりが続いています。(Giá cả đang tiếp tục tăng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3118, 51, 'ねあがり', '値上がり', 'tăng giá', '牛乳は生のまま飲みます。(Tôi uống sữa tươi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3119, 51, 'なま', '生', 'tươi', '喉が渇きました。(Tôi khát nước.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3120, 52, 'かわく', '渇く', 'khát', '香水を嗅ぎます。(Tôi ngửi nước hoa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3121, 52, 'かぐ', '嗅ぐ', 'ngửi', 'ドアを叩きます。(Tôi gõ cửa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3122, 52, 'たたく', '叩く', 'đánh, vỗ', '彼は友達を殴りました。(Anh ấy đã đánh bạn mình.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3123, 52, 'なぐる', '殴る', 'đấm', 'ボールを蹴ります。(Tôi đá quả bóng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3124, 52, 'ける', 'ける', 'đá', '赤ちゃんを抱きます。(Tôi ôm em bé.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3125, 52, 'だく', '抱く', 'ôm', '木が強風で倒れました。(Cây đã đổ do gió mạnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3126, 52, 'たおれる', '倒れる', 'đổ', '彼はビール瓶を倒しました。(Anh ấy đã làm đổ chai bia.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3127, 52, 'たおす', '倒す', 'làm đổ', '朝早く起きます。(Tôi dậy sớm vào buổi sáng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3128, 52, 'おきる', '起きる', 'thức dậy', '彼は私を起こしました。(Anh ấy đã đánh thức tôi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3129, 52, 'おこす', '起こす', 'đánh thức', '道を尋ねます。(Tôi hỏi đường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3130, 52, 'たずねる', '尋ねる', 'hỏi', '彼の名前を呼びます。(Tôi gọi tên anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3131, 52, 'よぶ', '呼ぶ', 'gọi', '助けを叫びます。(Tôi kêu cứu.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3132, 52, 'さけぶ', '叫ぶ', 'gào to', '彼は黙っていました。(Anh ấy đã im lặng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3133, 52, 'だまる', '黙る', 'im lặng', '犬を飼っています。(Tôi nuôi một con chó.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3134, 52, 'かう', '飼う', 'nuôi', '星の数を数えます。(Tôi đếm số lượng ngôi sao.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3135, 52, 'かぞえる', '数える', 'đếm', '洗濯物が乾きました。(Quần áo đã khô.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3136, 52, 'かわく', '乾く', 'khô', '髪を乾かします。(Tôi sấy khô tóc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3137, 52, 'かわかす', '乾かす', 'làm khô', '布団を畳みます。(Tôi gấp chăn đệm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3138, 52, 'たたむ', '畳む', 'gấp', '友達を映画に誘います。(Tôi mời bạn đi xem phim.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3139, 52, 'さそう', '誘う', 'mời, rủ', '彼に昼ご飯をおごりました。(Tôi đã mời anh ấy bữa trưa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3140, 52, 'おごる', 'おごる', 'chiêu đãi', '荷物を預かります。(Tôi giữ hành lý.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3141, 52, 'あずかる', '預かる', 'chăm sóc', 'お金を銀行に預けます。(Tôi gửi tiền vào ngân hàng.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3142, 52, 'あずける', '預ける', 'gửi', '会議の日程が決まりました。(Lịch họp đã được quyết định.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3143, 52, 'きまる', '決まる', 'được quyết định', '新しい仕事を決めました。(Tôi đã quyết định công việc mới.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3144, 52, 'きめる', '決める', 'quyết định', '写真にうまく写りました。(Tôi đã lên ảnh một cách đẹp đẽ.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3145, 52, 'うつる', '写る', 'chụp được', '景色を写真に写します。(Tôi chụp lại phong cảnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3146, 52, 'うつす', '写す', 'chụp', '昔のことを思い出します。(Tôi nhớ lại những chuyện xưa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3147, 52, 'おもいだす', '思い出す', 'nhớ lại', '先生に数学を教わります。(Tôi được giáo viên dạy môn toán.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3148, 52, 'おそわる', '教わる', 'được dạy', 'イベントに申し込みました。(Tôi đã đăng ký tham gia sự kiện.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3149, 52, 'もうしこむ', '申し込む', 'đăng ký', '彼の依頼を断りました。(Tôi đã từ chối yêu cầu của anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3150, 52, 'ことわる', '断る', 'từ chối', '鍵を見つけました。(Tôi đã tìm thấy chìa khóa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3151, 52, 'みつかる', '見つかる', 'được tìm thấy', '財布を見つけました。(Tôi đã tìm thấy ví tiền.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3152, 52, 'みつける', '見つける', 'tìm thấy', '警察に捕まりました。(Tôi đã bị cảnh sát bắt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3153, 52, 'つかまる', '捕まる', 'bị bắt', '彼を捕まえました。(Tôi đã bắt anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3154, 52, 'つかまえる', '捕まえる', 'bắt', 'バスに乗ります。(Tôi lên xe buýt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3155, 52, 'のる', '乗る', 'leo lên', '彼女を車に乗せます。(Tôi chở cô ấy bằng xe hơi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3156, 52, 'のせる', '乗せる', 'cho lên', '駅で降ります。(Tôi xuống tại ga.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3157, 52, 'おりる', '降りる', 'xuống', '彼を車から降ろします。(Tôi cho anh ấy xuống xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3158, 52, 'おろす', '降ろす', 'cho xuống', '車が直りました。(Xe đã được sửa chữa.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3159, 52, 'なおる', '直る', 'được sửa', '車を修理します。(Tôi sửa xe.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3160, 52, 'なおす', '直す', 'sửa', '病気が治りました。(Bệnh đã khỏi.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3161, 52, 'なおる', '治る', 'hồi phục', '医者が病気を治します。(Bác sĩ chữa bệnh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3162, 52, 'なおす', '治す', 'cứu chữa', '祖母が亡くなりました。(Bà tôi đã qua đời.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3163, 52, 'なくなる', '亡くなる', 'chết', '父を亡くしました。(Tôi đã mất cha.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3164, 52, 'なくす', '亡くす', 'mất', '赤ちゃんが生まれました。(Em bé đã được sinh ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3165, 52, 'うまれる', '生まれる', 'được sinh ra', '彼女が子供を生みました。(Cô ấy đã sinh con.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3166, 52, 'うむ', '生む', 'sinh', '彼と駅で出会いました。(Tôi đã gặp anh ấy ở ga.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3167, 52, 'であう', '出会う', 'gặp (ngẫu nhiên)', '友達の家を訪ねます。(Tôi thăm nhà bạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3168, 52, 'たずねる', '訪ねる', 'thăm', '彼と付き合っています。(Tôi đang hẹn hò với anh ấy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3169, 52, 'つきあう', '付き合う', 'hẹn hò, giao tiếp', '薬がよく効きます。(Thuốc có hiệu quả tốt.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3170, 52, 'きく', '効く', 'có hiệu quả', 'そのファッションが流行しています。(Thời trang đó đang thịnh hành.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3171, 52, 'はやる', 'はやる', 'phổ biến', '時間が経つのが早いです。(Thời gian trôi nhanh.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3172, 52, 'たつ', '経つ', 'qua', '会議に間に合いました。(Tôi đã kịp giờ họp.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3173, 52, 'まにあう', '間に合う', 'làm cho kịp giờ', '計画を間に合わせました。(Tôi đã hoàn thành kế hoạch đúng hạn.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3174, 52, 'まにあわせる', '間に合わせる', 'kịp giờ', '毎日学校に通っています。(Tôi đi học mỗi ngày.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3175, 52, 'かよう', '通う', 'đi làm, học', '電車が込んでいます。(Tàu điện đông đúc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3176, 52, 'こむ', '込む', 'đông', '道で人とすれ違いました。(Tôi đã lướt qua người trên đường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3177, 52, 'すれちあう', 'すれ違う', 'vượt, lướt', '時計が掛かっています。(Đồng hồ đang treo.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3178, 52, 'かかる', '掛かる', 'được bao phủ', '服をハンガーに掛けます。(Tôi treo áo vào móc.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3179, 52, 'かける', '掛ける', 'bao phủ', '車が動きません。(Xe không chạy.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3180, 52, 'うごく', '動く', 'hoạt động', '手を動かします。(Tôi cử động tay.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3181, 52, 'うごかす', '動かす', 'di chuyển', '家から離れます。(Tôi rời khỏi nhà.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3182, 52, 'はなれる', '離れる', 'tránh xa', '犬を放します。(Tôi thả chó ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3183, 52, 'はなす', '離す', 'tách ra', '車がぶつかります。(Xe bị va chạm.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3184, 52, 'ぶつかる', 'ぶつかる', 'bị đâm', '車を壁にぶつけました。(Tôi đã đâm xe vào tường.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3185, 52, 'ぶつける', 'ぶつける', 'đâm', 'ジュースがこぼれました。(Nước trái cây đã đổ ra.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3186, 52, 'こぼれる', 'こぼれる', 'bị tràn', '水をこぼします。(Tôi làm đổ nước.)');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3187, 52, 'こぼす', 'こぼす', 'tràn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3188, 52, 'ふく', 'ふく', 'lau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3189, 52, 'かたづく', '片付く', 'được dọn dẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3190, 52, 'かたづける', '片付ける', 'dọn dẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3191, 52, 'つつむ', '包む', 'bọc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3192, 52, 'はる', '張る', 'dán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3193, 52, 'なくなる', '無くなる', 'bị mất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3194, 52, 'なくす', '無くす', 'mất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3195, 52, 'たりる', '足りる', 'đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3196, 52, 'のこる', '残る', 'bị thừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3197, 52, 'のこす', '残す', 'thừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3198, 52, 'くさる', '腐る', 'thối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3199, 52, 'むける', 'むける', 'bị lột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3200, 52, 'むく', 'むく', 'lột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3201, 52, 'すべる', '滑る', 'trượt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3202, 52, 'つもる', '積もる', 'được tích tụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3203, 52, 'つむ', '積む', 'tích tụ, chất lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3204, 52, 'あく', '空く', 'bị thủng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3205, 52, 'あける', '空ける', 'thủng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3206, 52, 'さがる', '下がる', 'bị giảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3207, 52, 'さげる', '下げる', 'giảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3208, 52, 'ひえる', '冷える', 'bị lạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3209, 52, 'ひやす', '冷やす', 'làm lạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3210, 52, 'さめる', '冷める', 'bị nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3211, 52, 'さます', '冷ます', 'làm nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3212, 52, 'もえる', '燃える', 'cháy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3213, 52, 'もやす', '燃やす', 'đốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3214, 52, 'わく', '沸く', 'sôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3215, 52, 'わかす', '沸かす', 'đun sôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3216, 52, 'なる', '鳴る', 'kêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3217, 52, 'ならす', '鳴らす', 'làm kêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3218, 52, 'やくだつ', '役立つ', 'hữu ích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3219, 52, 'やくだてる', '役立てる', 'được sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3220, 52, 'かざり', '飾り', 'trang trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3221, 52, 'あそび', '遊び', 'chơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3222, 52, 'あつまり', '集まり', 'tập hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3223, 52, 'おしえ', '教え', 'dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3224, 52, 'おどり', '踊り', 'nhảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3225, 52, 'おもい', '思い', 'suy nghĩ, cảm giác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3226, 52, 'かんがえ', '考え', 'nghĩ, ý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3227, 52, 'かたづけ', '片づけ', 'ngăn nắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3228, 52, 'てつだい', '手伝い', 'giúp đỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3229, 52, 'はたらき', '働き', 'hoạt động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3230, 52, 'きまり', '決まり', 'luật lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3231, 52, 'さわぎ', '騒ぎ', 'ồn ào, om xòm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3232, 52, 'しらせ', '知らせ', 'tin tức, thông báo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3233, 52, 'たのみ', '頼み', 'yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3234, 52, 'つかれ', '疲れ', 'vất vả, mệt mỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3235, 52, 'ちがい', '違い', 'khác biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3236, 52, 'はじめ', '始め', 'khởi đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3237, 52, 'つづき', '続き', 'tiếp tục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3238, 52, 'くれ', '暮れ', 'cuối năm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3239, 52, 'いき', '行き', 'đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3240, 53, 'かえり', '帰り', 'trở về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3241, 53, 'いそぎ', '急ぎ', 'khẩn cấp, vội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3242, 53, 'おくれ', '遅れ', 'gián đoạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3243, 53, 'かし', '貸し', 'cho mượn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3244, 53, 'かり', '借り', 'mượn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3245, 53, 'かち', '勝ち', 'thắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3246, 53, 'まけ', '負け', 'thua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3247, 53, 'むかえ', '迎え', 'đón', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3248, 53, 'はじまり', '始まり', 'bắt đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3249, 53, 'おわり', '終わり', 'kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3250, 53, 'もどり', '戻り', 'trở về, trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3251, 53, 'わかれ', '別れ', 'chia ly', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3252, 53, 'よろこび', '喜び', 'hớn hở', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3253, 53, 'たのしみ', '楽しみ', 'sung sướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3254, 53, 'わらい', '笑い', 'cười', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3255, 53, 'おどろき', '驚き', 'ngạc nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3256, 53, 'いかり', '怒り', 'giận dữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3257, 53, 'かたしみ', '悲しみ', 'buồn bã', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3258, 53, 'しあわせな', '幸せな', 'hạnh phúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3259, 53, 'とくいな', '得意な', 'mạnh, giỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3260, 53, 'にがてな', '苦手な', 'yếu, kém', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3261, 53, 'ねっしんな', '熱心な', 'chăm chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3262, 53, 'むちゅうな', '夢中な', 'chú tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3263, 53, 'たいくつな', '退屈な', 'chán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3264, 53, 'けんこうな', '健康な', 'khỏe khoắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3265, 53, 'くるしい', '苦しい', 'cực khổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3266, 53, 'へいきな', '平気な', 'bình thản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3267, 53, 'くやしい', '悔しい', 'cay cú', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3268, 53, 'うらやましい', 'うらやましい', 'ghen tỵ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3269, 53, 'かゆい', 'かゆい', 'ngứa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3270, 53, 'おとなしい', 'おとなしい', 'trầm lặng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3271, 53, 'がまんづよい', '我慢強い', 'chịu đựng giỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3272, 53, 'しょうじきな', '正直な', 'trung thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3273, 53, 'けちな', 'けちな', 'kẹt xỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3274, 53, 'わがままな', '我儘な', 'ích kỷ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3275, 53, 'せっきょくてきな', '積極的な', 'tích cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3276, 53, 'しょうきょくてきな', '消極的な', 'tiêu cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3277, 53, 'まんぞくな', '満足な', 'thỏa mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3278, 53, 'ふまんな', '不満な', 'bất mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3279, 53, 'ふあんな', '不安な', 'bất an', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3280, 53, 'たいへんな', '大変な', 'tồi tệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3281, 53, 'むりな', '無理な', 'vô lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3282, 53, 'ふちゅういな', '不注意な', 'không chú ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3283, 53, 'らくな', '楽な', 'thoải mái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3284, 53, 'めんどうな', '面倒な', 'phiền phức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3285, 53, 'しつれいな', '失礼な', 'thất lễ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3286, 53, 'とうぜんな', '当然な', 'đương nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3287, 53, 'いがいな', '意外な', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3288, 53, 'けっこうな', '結構な', 'tốt, đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3289, 53, 'はでな', '派手な', 'lòe loẹt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3290, 53, 'じみな', '地味な', 'giản dị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3291, 53, 'おしゃれな', 'おしゃれな', 'thời trang, mốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3292, 53, 'へんな', '変な', 'lạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3293, 53, 'ふしぎな', '不思議な', 'thần bí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3294, 53, 'ましな', 'ましな', 'tốt lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3295, 53, 'むだな', 'むだな', 'lãng phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3296, 53, 'じゆうな', '自由な', 'tự do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3297, 53, 'ふじゆうな', '不自由な', 'tàn tật, không tự do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3298, 53, 'あたたまる', '温まる', 'trở nên ấm hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3299, 53, 'あたためる', '温める', 'ấm, nóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3300, 53, 'たかまる', '高まる', 'cao lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3301, 53, 'たかめる', '高める', 'làm cao lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3302, 53, 'つよまる', '強まる', 'mạnh lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3303, 53, 'つよめる', '強める', 'làm mạnh lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3304, 53, 'よわまる', '弱まる', 'yếu đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3305, 53, 'よわめる', '弱める', 'làm yếu đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3306, 53, 'ひろまる', '広まる', 'rộng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3307, 53, 'ひろめる', '広める', 'làm rộng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3308, 53, 'ふかまる', '深まる', 'sâu hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3309, 53, 'ふかめる', '深める', 'làm sâu thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3310, 53, 'せわ', '世話', 'chăm sóc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3311, 53, 'かてい', '家庭', 'gia đình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3312, 53, 'きょうりょく', '協力', 'hiệp lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3313, 53, 'かんしゃ', '感謝', 'cảm tạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3314, 53, 'おれい', 'お礼', 'đáp lễ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3315, 53, 'おわび', 'お詫び', 'xin lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3316, 53, 'おじぎ', 'おじぎ', 'cúi chào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3317, 53, 'あくしゅ', '握手', 'bắt tay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3318, 53, 'いじわる', 'いじわる', 'xấu bụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3319, 53, 'いたずら', 'いたずら', 'nghịch ngợm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3320, 53, 'せつやく', '節約', 'tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3321, 53, 'けいえい', '経営', 'quản lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3322, 53, 'はんせい', '反省', 'tự kiểm tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3323, 53, 'じっこう', '実行', 'thực hành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3324, 53, 'しんぽ', '進歩', 'tiến bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3325, 53, 'へんか', '変化', 'thay đổi, biến hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3326, 53, 'はったつ', '発達', 'phát triển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3327, 53, 'たいりょく', '体力', 'thể lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3328, 53, 'しゅつじょう', '出場', 'tham dự', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3329, 53, 'かつやく', '活躍', 'hoạt động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3330, 53, 'きょうそう', '競争', 'cạnh tranh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3331, 53, 'おうえん', '応援', 'cổ vũ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3332, 53, 'はくしゅ', '拍手', 'vỗ tay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3333, 53, 'にんき', '人気', 'nổi tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3334, 53, 'うわさ', 'うわさ', 'tin đồn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3335, 53, 'じょうほう', '情報', 'thông tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3336, 53, 'こうかん', '交換', 'trao đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3337, 53, 'りゅうこう', '流行', 'trào lưu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3338, 53, 'せんでん', '宣伝', 'tuyên truyền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3339, 53, 'こうこく', '広告', 'quảng cáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3340, 53, 'ちゅうもく', '注目', 'chú trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3341, 53, 'つうやく', '通訳', 'thông dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3342, 53, 'ほにゃく', '翻訳', 'biên dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3343, 53, 'でんごん', '伝言', 'tin nhắn thoại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3344, 53, 'ほうこく', '報告', 'báo cáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3345, 53, 'ろくが', '録画', 'ghi lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3346, 53, 'こんざつ', '混雑', 'hỗn tạp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3347, 53, 'じゅうたい', '渋滞', 'tắc đường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3348, 53, 'しょうとつ', '衝突', 'xung đột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3349, 53, 'ひがい', '被害', 'thiệt hại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3350, 53, 'じこ', '事故', 'tai nạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3351, 53, 'じけん', '事件', 'sự kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3352, 53, 'こしょう', '故障', 'hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3353, 53, 'しゅうり', '修理', 'sửa chữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3354, 53, 'ていでん', '停電', 'mất điện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3355, 53, 'ちょうし', '調子', 'trạng thái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3356, 53, 'きんちょう', '緊張', 'lo lắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3357, 53, 'じしん', '自身', 'tự tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3358, 53, 'じまん', '自慢', 'tự mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3359, 53, 'かんしん', '感心', 'quan tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3360, 54, 'かんどう', '感動', 'cảm động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3361, 54, 'こうふん', '興奮', 'hưng phấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3362, 54, 'かんそう', '感想', 'cảm tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3363, 54, 'よそう', '予想', 'dự đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3364, 54, 'せんもん', '専門', 'chuyên môn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3365, 54, 'けんきゅう', '研究', 'nghiên cứu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3366, 54, 'ちょうさ', '調査', 'điều tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3367, 54, 'げんいん', '原因', 'nguyên nhân', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3368, 54, 'けっか', '結果', 'kết quả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3369, 54, 'かいけつ', '解決', 'giải quyết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3370, 54, 'かくにん', '確認', 'xác nhận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3371, 54, 'りよう', '利用', 'sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3372, 54, 'りかい', '理解', 'lý giải', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3373, 54, 'はっけん', '発見', 'phát kiến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3374, 54, 'はつめい', '発明', 'phát minh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3375, 54, 'かんけい', '関係', 'quan hệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3376, 54, 'だんたい', '団体', 'đoàn thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3377, 54, 'せんきょ', '選挙', 'bầu cử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3378, 54, 'ぜいきん', '税金', 'thuế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3379, 54, 'せきにん', '責任', 'trách nhiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3380, 54, 'しょるい', '書類', 'tài liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3381, 54, 'だいめい', '題名', 'tiêu đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3382, 54, 'じょうけん', '条件', 'điều kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3383, 54, 'しめきり', '締め切り', 'hạn cuối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3384, 54, 'きかん', '期間', 'thời gian, thời kỳ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3385, 54, 'ばい', '倍', 'lần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3386, 54, 'くじ', 'くじ', 'xổ số, rút thăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3387, 54, 'ちかみち', '近道', 'đường tắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3388, 54, 'ちゅうしん', '中心', 'trung tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3389, 54, 'あたり', '辺り', 'gần, lân cận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3390, 54, 'まわり', '周り', 'xung quanh, vòng quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3391, 54, 'あな', '穴', 'lỗ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3392, 54, 'れつ', '列', 'hàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3393, 54, 'はば', '幅', 'chiều rộng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3394, 54, 'はんい', '範囲', 'phạm vi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3395, 54, 'ないよう', '内容', 'nội dung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3396, 54, 'なかみ', '中身', 'bên trong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3397, 54, 'とくちょう', '特徴', 'đặc trưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3398, 54, 'ふつう', '普通', 'bình thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3399, 54, 'あたりまえ', '当たり前', 'đương nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3400, 54, 'にせ', '偽', 'giả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3401, 54, 'べつ', '別', 'khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3402, 54, 'こくせき', '国籍', 'quốc tịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3403, 54, 'とうよう', '東洋', 'phương đông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3404, 54, 'せいよう', '西洋', 'phương tây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3405, 54, 'こくさい', '国際', 'quốc tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3406, 54, 'しぜん', '自然', 'tự nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3407, 54, 'けしき', '景色', 'phong cảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3408, 54, 'しゅうきょう', '宗教', 'tôn giáo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3409, 54, 'あい', '愛', 'yêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3410, 54, 'とどく', '届く', 'được giao đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3411, 54, 'とどける', '届ける', 'giao đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3412, 54, 'かく', 'かく', 'gãi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3413, 54, 'つかむ', 'つかむ', 'tóm, chộp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3414, 54, 'にぎる', '握る', 'nắm chặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3415, 54, 'おさえる', '抑える', 'giữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3416, 54, 'ちかづく', '近づく', 'lại gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3417, 54, 'ちかづける', '近づける', 'mang đến gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3418, 54, 'あう', '合う', 'gặp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3419, 54, 'あわせる', '合わせる', 'tập hợp, hiệp lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3420, 54, 'あたる', '当たる', 'bị đánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3421, 54, 'あてる', '当てる', 'đánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3422, 54, 'くらべる', '比べる', 'so sánh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3423, 54, 'にあう', '似合う', 'hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3424, 54, 'にる', '似る', 'giống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3425, 54, 'にせる', '似せる', 'bắt chước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3426, 54, 'わかれる', '分かれる', 'được chia ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3427, 54, 'わける', '分ける', 'chia', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3428, 54, 'たす', '足す', 'cộng, thêm vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3429, 54, 'ひく', '引く', 'kéo, trừ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3430, 54, 'ふえる', '増える', 'tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3431, 54, 'ふやす', '増やす', 'làm tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3432, 54, 'へる', '減る', 'giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3433, 54, 'へらす', '減らす', 'làm giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3434, 54, 'かわる', '変わる', 'thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3435, 54, 'かえる', '変える', 'làm thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3436, 54, 'かわる', '代わる・替わる・換わる', 'thay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3437, 54, 'かえる', '代える・替える・換える', 'đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3438, 54, 'かえる', '返る', 'được trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3439, 54, 'かえす', '返す', 'trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3440, 54, 'ゆずる', '譲る', 'nhường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3441, 54, 'たすかる', '助かる', 'được giúp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3442, 54, 'たすける', '助ける', 'giúp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3443, 54, 'いじめる', 'いじめる', 'bắt nạt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3444, 54, 'だまる', 'だまる', 'lừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3445, 54, 'ぬすむ', '盗む', 'lấy cắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3446, 54, 'ささる', '刺さる', 'bị đâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3447, 54, 'さす', '刺す', 'đâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3448, 54, 'ころす', '殺す', 'giết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3449, 54, 'かくれる', '隠れる', 'ẩn náu, trốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3450, 54, 'かくす', '隠す', 'che giấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3451, 54, 'うまる', '埋まる', 'bị chôn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3452, 54, 'うめる', '埋める', 'chôn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3453, 54, 'かこむ', '囲む', 'vây quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3454, 54, 'つまる', '詰まる', 'đầy, chặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3455, 54, 'つめる', '詰める', 'đóng gói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3456, 54, 'ひらく', '開く', 'mở', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3457, 54, 'とじる', '閉じる', 'dđóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3458, 54, 'とぶ', '飛ぶ', 'bay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3459, 54, 'とばす', '飛ばす', 'cho bay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3460, 54, 'ふる', '振る', 'rung, vẫy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3461, 54, 'めくる', 'めくる', 'lật lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3462, 54, 'みかける', '見かける', 'tình cờ thấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3463, 54, 'たしかめる', '確かめる', 'kiểm tra lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3464, 54, 'ためす', '試す', 'thử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3465, 54, 'くりかえす', '繰り返す', 'lặp lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3466, 54, 'やくす', '訳す', 'dịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3467, 54, 'おこなう', '行う', 'tổ chức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3468, 54, 'まちがう', '間違う', 'bị sai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3469, 54, 'まちがえる', '間違える', 'làm sai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3470, 54, 'ゆるす', '許す', 'tha thứ, cho phép', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3471, 54, 'なれる', '慣れる', 'quen', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3472, 54, 'ならす', '慣らす', 'khởi động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3473, 54, 'たつ', '立つ', 'đứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3474, 54, 'たてる', '立てる', 'dựng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3475, 54, 'たつ', '建つ', 'được xây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3476, 54, 'たてる', '建てる', 'xây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3477, 54, 'そだつ', '育つ', 'được nuôi dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3478, 54, 'そだてる', '育てる', 'nuôi, dạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3479, 54, 'はえる', '生える', 'mọc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3480, 55, 'はやす', '生やす', 'nuôi(râu)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3481, 55, 'よごれる', '汚れる', 'bị bẩn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3482, 55, 'よごす', '汚す', 'làm bẩn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3483, 55, 'こわれる', '壊れる', 'bị hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3484, 55, 'こわす', '壊す', 'làm hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3485, 55, 'われる', '割れる', 'bị vỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3486, 55, 'わる', '割る', 'làm vỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3487, 55, 'おれる', '折れる', 'bị gãy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3488, 55, 'おる', '折る', 'làm gãy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3489, 55, 'やぶれる', '破れる', 'bị rách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3490, 55, 'やぶる', '破る', 'xé rách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3491, 55, 'まがる', '曲がる', 'gập, cong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3492, 55, 'まげる', '曲げる', 'bẻ, uốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3493, 55, 'はずれる', '外れる', 'bị rời ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3494, 55, 'はずす', '外す', 'tách ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3495, 55, 'ゆれる', '揺れる', 'bị rung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3496, 55, 'ゆらす', '揺らす', 'đung đưa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3497, 55, 'ながれる', '流れる', 'chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3498, 55, 'ながす', '流す', 'cho chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3499, 55, 'ぬれる', '濡れる', 'bị ướt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3500, 55, 'ぬらす', '濡らす', 'làm ướt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3501, 55, 'まよう', '迷う', 'lạc đường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3502, 55, 'なやむ', '悩む', 'băn khoăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3503, 55, 'あわてる', '慌てる', 'vội vàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3504, 55, 'さめる', '覚める', 'thức dậy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3505, 55, 'さます', '覚ます', 'mở mắt, tỉnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3506, 55, 'ねむる', '眠る', 'ngủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3507, 55, 'いのる', '祈る', 'cầu, khấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3508, 55, 'いわう', '祝う', 'ăn mừng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3509, 55, 'かんじる', '感じる', 'cảm thấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3510, 55, '', 'クラスメート', 'bạn cùng lớp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3511, 55, '', 'グループ', 'nhóm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3512, 55, '', 'チーム', 'đội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3513, 55, '', 'プロフェッショナル', 'chuyên nghiệp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3514, 55, '', 'アマチュア', 'nghiệp dư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3515, 55, '', 'トレーニング', 'đào tạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3516, 55, '', 'マッサージ', 'mát xa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3517, 55, '', 'アドバイス', 'khuyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3518, 55, '', 'アイデア・アイディア', 'ý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3519, 55, '', 'トップ', 'top', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3520, 55, '', 'スピード', 'tốc độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3521, 55, '', 'ラッシュ', 'đông đúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3522, 55, '', 'バイク', 'xe máy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3523, 55, '', 'ヘルメット', 'mũ bảo hiểm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3524, 55, '', 'コンタクトレンズ', 'kính áp tròng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3525, 55, '', 'ガラス', 'kính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3526, 55, '', 'プラスチック', 'nhựa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3527, 55, '', 'ベランダ', 'ban công', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3528, 55, '', 'ペット', 'thú cưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3529, 55, '', 'ベンチ', 'ghế bành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3530, 55, '', 'デザイン', 'thiết kế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3531, 55, '', 'バーゲンセール', 'sale', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3532, 55, '', 'パート', 'làm thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3533, 55, '', 'コンビニエンスストア', 'cửa hàng tiện ích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3534, 55, '', 'レジ', 'máy tính tiền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3535, 55, '', 'レシート', 'hóa đơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3536, 55, '', 'インスタント', 'ăn liền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3537, 55, '', 'ファストフード', 'đồ ăn nhanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3538, 55, '', 'フルーツ', 'trái cây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3539, 55, '', 'デザート', 'tráng miệng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3540, 55, '', 'インターネット', 'internet', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3541, 55, '', 'チャイム', 'chuông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3542, 55, '', 'アナウンス', 'thông báo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3543, 55, '', 'メッセージ', 'tin nhắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3544, 55, '', 'パンフレット', 'tờ rơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3545, 55, '', 'カード', 'card', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3546, 55, '', 'インタビュー', 'phỏng vấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3547, 55, '', 'アンケート', 'tờ câu hỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3548, 55, '', 'データ', 'dữ liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3549, 55, '', 'パーセント', 'phần trăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3550, 55, 'こい', '濃い', 'đậm, đặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3551, 55, 'うすい', '薄い', 'mỏng, nhạt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3552, 55, 'すっぱい', '酸っぱい', 'chua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3553, 55, 'くさい', '臭い', 'thối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3554, 55, 'おかしい', 'おかしい', 'lạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3555, 55, 'かっこいい', 'かっこいい', 'bảnh bao', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3556, 55, 'うまい', 'うまい', 'ngon', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3557, 55, 'したしい', '親しい', 'thân thiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3558, 55, 'くわしい', '詳しい', 'chi tiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3559, 55, 'こまかい', '細かい', 'tiểu tiết, bé', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3560, 55, 'あさい', '浅い', 'nông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3561, 55, 'かたい', '固い・硬い', 'cứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3562, 55, 'ぬるい', 'ぬるい', 'nguội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3563, 55, 'まぶしい', 'まぶしい', 'chói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3564, 55, 'むしあつい', '蒸し暑い', 'nóng ẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3565, 55, 'せいけつな', '清潔な', 'sạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3566, 55, 'しんせんな', '新鮮な', 'tươi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3567, 55, 'ゆたかな', '豊かな', 'giàu có', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3568, 55, 'りっぱな', '立派な', 'siêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3569, 55, 'せいかくな', '正確な', 'chính xác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3570, 55, 'たしかな', '確かな', 'đích thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3571, 55, 'じゅうような', '重要な', 'quan trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3572, 55, 'ひつような', '必要な', 'cần thiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3573, 55, 'もったいない', 'もったいない', 'lãng phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3574, 55, 'すごい', 'すごい', 'ghê, siêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3575, 55, 'ひどい', 'ひどい', 'tồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3576, 55, 'はげしい', '激しい', 'mãnh liệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3577, 55, 'そっくりな', 'そっくりな', 'giống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3578, 55, 'きゅうな', '急な', 'đột nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3579, 55, 'てきとな', '敵とな', 'phù hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3580, 55, 'とくべつな', '特別な', 'đặc biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3581, 55, 'かんぜんな', '完全な', 'toàn bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3582, 55, 'さかんな', '盛んな', 'thịnh vượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3583, 55, 'さまざまな', '様々な', 'đa đạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3584, 55, 'かのうな', '可能な', 'khả thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3585, 55, 'ふかのうな', '不可能な', 'bất khả thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3586, 55, 'きほんてきな', '基本的な', 'cơ bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3587, 55, 'こくさいてきな', '国際的な', 'tính quốc tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3588, 55, 'ばらばらな', 'ばらばらな', 'tung tóe, chia rẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3589, 55, 'ぼろぼろな', 'ぼろぼろな', 'rách nát, te tua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3590, 55, 'たいへんに', '大変に', 'khủng khiếp, rất nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3591, 55, 'ほとんど', 'ほとんど', 'gần như hoàn toàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3592, 55, 'だいたい', '大体', 'phần lớn, trong khoảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3593, 55, 'かなり', 'かなり', 'khá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3594, 55, 'ずいぶん', 'ずいぶん', 'đáng kể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3595, 55, 'けっこう', 'けっこう', 'rất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3596, 55, 'ずいぶん', '大分', 'chủ yếu, khá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3597, 55, 'もっと', 'もっと', 'hơn, nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3598, 55, 'しっかり', 'しっかり', 'toàn bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3599, 55, 'いっぱい', 'いっぱい', 'đầy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3600, 56, 'ぎりぎり', 'ぎりぎり', 'gần, sát nút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3601, 56, 'ぴったり', 'ぴったり', 'vừa vặn, đúng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3602, 56, 'たいてい', 'たいてい', 'đại thể, thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3603, 56, 'どうじに', '同時に', 'cùng lúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3604, 56, 'まえもって', '前もって', 'trước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3605, 56, 'すぐに', 'すぐに', 'ngay lập tức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3606, 56, 'もうすぐ', 'もうすぐ', 'sắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3607, 56, 'とつぜん', '突然', 'đột nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3608, 56, 'あっというまに', 'あっという間に', 'loáng một cái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3609, 56, 'いつのまにか', 'いつの間にか', 'lúc nào không biết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3610, 56, 'しばらく', 'しばらく', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3611, 56, 'ずっと', 'ずっと', 'suốt, nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3612, 56, 'あいかわらず', '相変わらず', 'như mọi khi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3613, 56, 'つぎつぎに', '次々に', 'lần lượt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3614, 56, 'どんどん', 'どんどん', 'dần dần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3615, 56, 'ますます', 'ますます', 'càng ngày càng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3616, 56, 'やっと', 'やっと', 'cuối cùng, vừa đủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3617, 56, 'とうとう', 'とうとう', 'sau cùng, cuối cùng, sau tất cả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3618, 56, 'ついに', 'ついに', 'cuối cùng, sau cùng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3619, 56, 'もちろん', 'もちろん', 'tất nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3620, 56, 'やはり', 'やはり', 'như dự tính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3621, 56, 'きっと', 'きっと', 'nhất định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3622, 56, 'ぜひ', 'ぜひ', 'bằng mọi giá, rất (muốn)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3623, 56, 'なるべく', 'なるべく', 'càng nhiều càng tốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3624, 56, 'あんがい', '案外', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3625, 56, 'もしかすると・もしかしたら・もしかして', 'もしかすると・もしかしたら・もしかして', 'có lẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3626, 56, 'まさか', 'まさか', 'không thể ngờ, không', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3627, 56, 'うっかり', 'うっかり', 'ngơ ngác, không để ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3628, 56, 'つい', 'つい', 'vô ý, buột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3629, 56, 'おもわず', '思わず', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3630, 56, 'ほっと', 'ほっと', 'yên tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3631, 56, 'いらいら', 'いらいら', 'khó chịu, nóng giận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3632, 56, 'のんびり', 'のんびり', 'tận hưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3633, 56, 'じつは', '実は', 'thực tế là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3634, 56, 'どくしょ', '読書', 'đọc viết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3635, 56, 'えんそう', '演奏', 'biểu diễn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3636, 56, 'げいじゅつ', '芸術', 'nghệ thuật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3637, 56, 'けんさ', '検査', 'kiểm tra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3638, 56, 'けつえき', '血液', 'máu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3639, 56, 'ちりょう', '治療', 'trị liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3640, 56, 'しょうじょう', '症状', 'triệu chứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3641, 56, 'よぼう', '予防', 'dự phòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3642, 56, 'えいよう', '栄養', 'dinh dưỡng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3643, 56, 'しゅじゅつ', '手術', 'phẫu thuật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3644, 56, 'しぼう', '死亡', 'tử vong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3645, 56, 'いのち', '命', 'sinh mạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3646, 56, 'いっしょう', '一生', 'suốt đời', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3647, 56, 'ごかい', '誤解', 'hiểu nhầm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3648, 56, 'こうかい', '後悔', 'hối hận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3649, 56, 'わけ', '訳', 'lý do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3650, 56, 'たいど', '態度', 'thái độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3651, 56, 'くせ', '癖', 'thói quen', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3652, 56, 'れいぎ', '礼儀', 'lễ nghĩa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3653, 56, 'もんく', '文句', 'phàn nàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3654, 56, 'ひょうじょう', '表情', 'biểu lộ, biểu thị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3655, 56, 'ひょうめん', '鏡面', 'bề mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3656, 56, 'きんえん', '禁煙', 'cấm hút thuốc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3657, 56, 'きんし', '禁止', 'cấm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3658, 56, 'かんせい', '完成', 'hoàn thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3659, 56, 'かだい', '課題', 'chủ đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3660, 56, 'れいがい', '例外', 'ngoại lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3661, 56, 'きほん', '基本', 'cơ bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3662, 56, 'きろく', '記録', 'ghi âm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3663, 56, 'じょうたい', '状態', 'trạng thái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3664, 56, 'できごと', '出来事', 'sự kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3665, 56, 'ばめん', '場面', 'khung cảnh, tình huống, hiện trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3666, 56, 'きかい', '機会', 'cơ hội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3667, 56, 'きょり', '距離', 'khoảng cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3668, 56, 'ていあん', '提案', 'đề xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3669, 56, 'やりとり', 'やり取り', 'trao đổi, làm việc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3670, 56, 'ちしき', '知識', 'kiến thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3671, 56, 'じつりょく', '実力', 'thực lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3672, 56, 'しゅだん', '手段', 'cách thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3673, 56, 'だいひょう', '代表', 'đại biểu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3674, 56, 'えいきょう', '影響', 'ảnh hưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3675, 56, 'こうか', '効果', 'hiệu quả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3676, 56, 'いんしょう', '印象', 'ấn tượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3677, 56, 'しるし', '印', 'dấu, dấu hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3678, 56, 'あいず', '合図', 'ám hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3679, 56, 'きょうつう', '共通', 'chung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3680, 56, 'きょうちょう', '協調', 'nhấn mạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3681, 56, 'しょうりゃく', '省略', 'lược bớt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3682, 56, 'ちょうせん', '挑戦', 'thử thách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3683, 56, 'やるき', 'やる気', 'động lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3684, 56, 'ゆうき', '勇気', 'dũng cảm, dũng khí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3685, 56, 'しかく', '資格', 'bằng cấp, tư cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3686, 56, 'しんせい', '申請', 'đăng ký, ứng tuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3687, 56, 'ほんにん', '本人', 'người được nói đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3688, 56, 'けいやく', '契約', 'hợp đồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3689, 56, 'しょうめい', '証明', 'chứng minh, bằng chứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3690, 56, 'へんこう', '変更', 'thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3691, 56, 'ほぞん', '保存', 'bảo tồn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3692, 56, 'ほご', '保護', 'bảo vệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3693, 56, 'かんきょう', '環境', 'môi trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3694, 56, 'しげん', '資源', 'tài nguyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3695, 56, 'ふそく', '不足', 'thiếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3696, 56, 'へいきん', '平均', 'trung bình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3697, 56, 'わりあい', '割合', 'tỷ lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3698, 56, 'しょうばい', '商売', 'kinh doanh, buôn bán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3699, 56, 'しょうひん', '商品', 'sản phẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3700, 56, 'しつ', '質', 'chất lượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3701, 56, 'かた', '型', 'mẫu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3702, 56, 'せいさん', '生産', 'sản xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3703, 56, 'しょうひ', '消費', 'tiêu dùng, tiêu thụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3704, 56, 'ぶっか', '物価', 'giá cả, vật giá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3705, 56, 'とうさん', '倒産', 'phá sản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3706, 56, 'けいたい', '携帯', 'mang theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3707, 56, 'げんだい', '現代', 'hiện tại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3708, 56, 'せいき', '世紀', 'thế kỷ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3709, 56, 'ぶんか', '文化', 'văn hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3710, 56, 'とし', '都市', 'thành phố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3711, 56, 'ちほう', '地方', 'địa phương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3712, 56, 'せんそう', '戦争', 'chiến tranh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3713, 56, 'へいわ', '平和', 'hòa bình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3714, 56, 'のぼる', '上る', 'leo lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3715, 56, 'くだる', '下る', 'đi xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3716, 56, 'すすむ', '進む', 'tiến lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3717, 56, 'すすめる', '進める', 'làm cho tiến lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3718, 56, 'とおる', '通る', 'thông qua, được chấp nhận, đi qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3719, 56, 'とおす', '通す', 'xuyên qua, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3720, 57, 'こえる', '超える・越える', 'vượt qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3721, 57, 'すぎる', '過ぎる', 'quá, đi qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3722, 57, 'すごす', '過ごす', 'sử dụng(thời gian)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3723, 57, 'うつる', '移る', 'được chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3724, 57, 'うつす', '移す', 'chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3725, 57, 'つれる', '連れる', 'dẫn đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3726, 57, 'よる', '寄る', 'ghé sát, lại gần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3727, 57, 'よせる', '寄せる', 'ghé vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3728, 57, 'あたえる', '与える', 'trao, cung cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3729, 57, 'える', '得る', 'đạt được, có được', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3730, 57, 'むく', '向く', 'hướng, đối diện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3731, 57, 'むける', '向ける', 'hướng đến, quay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3732, 57, 'すすめる', '勧める', 'rủ, mời, gợi ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3733, 57, 'すすめる', '薦める', 'giới thiệu, gợi ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3734, 57, 'まかせる', '任せる', 'tin tưởng, để cho ai đó làm gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3735, 57, 'まもる', '守る', 'giữ, tuân thủ, bảo vệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3736, 57, 'あらそう', '争う', 'gây gổ, tranh giành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3737, 57, 'のぞむ', '臨む', 'ước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3738, 57, 'しんじる', '信じる', 'tin tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3739, 57, 'つうじる', '通じる', 'hiểu, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3740, 57, 'あきる', '飽きる', 'chán, ngấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3741, 57, 'おもいつく', '思いつく', 'nghĩ về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3742, 57, 'おもいやる', '思いやる', 'quan tâm, thông cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3743, 57, 'ねっちゅうする', '熱中する', 'nghiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3744, 57, 'くらす', '暮らす', 'sống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3745, 57, 'まく', '巻く', 'quấn, quàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3746, 57, 'むすぶ', '結ぶ', 'buộc, cột, nối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3747, 57, 'すむ', '済む', 'kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3748, 57, 'すませる・済ます', '済ませる・済ます', 'hoàn tất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3749, 57, 'できる', '出来る', 'có thể, được xây dựng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3750, 57, 'きれる', '切れる', 'cắt, hết hạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3751, 57, 'きらす', '切らす', 'hết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3752, 57, 'つたわる', '伝わる', 'được truyền đi, được trải ra, được giới thiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3753, 57, 'つたえる', '伝える', 'truyền đi, giới thiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3754, 57, 'つづく', '続く', 'tiếp tục, xảy ra, lặp lại, theo sau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3755, 57, 'つづける', '続ける', 'tiếp tục, xảy ra liên tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3756, 57, 'つながる', 'つながる', 'được kết nối, được mở rộng, thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3757, 57, 'つなぐ', 'つなぐ', 'kết nối, tham gia', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3758, 57, 'つなげる', 'つなげる', 'kết nối, làm chặt thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3759, 57, 'のびる', '伸びる', 'lớn lên, tăng thêm, dài ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3760, 57, 'のばす', '伸ばす', 'nuôi dài, căng ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3761, 57, 'のびる', '延びる', 'bị trì hoãn, bị kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3762, 57, 'のばす', '延ばす', 'trì hoãn, kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3763, 57, 'かさなる', '重なる', 'xung đột, xếp chồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3764, 57, 'かさねる', '重ねる', 'chồng lên, tích trữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3765, 57, 'ひろがる', '広がる', 'mở rộng, bùng phát, lan tràn, trải dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3766, 57, 'ひろげる', '広げる', 'mở thêm, mở rộng, nới rộng, mở ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3767, 57, 'のる', '載る', 'vừa, được công bố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3768, 57, 'のせる', '載せる', 'cho vào, cho lên, công bố', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3769, 57, 'そろう', 'そろう', 'thu thập, được thu thập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3770, 57, 'そろえる', 'そろえる', 'gom lại, chuẩn bị sẵn sàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3771, 57, 'まとまる', 'まとまる', 'được thống nhất, được tổ chức, được sắp xếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3772, 57, 'まとめる', 'まとめる', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3773, 57, 'つく', '付く', 'dính, gắn, đạt được, đi cùng với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3774, 57, 'つける', '付ける', 'gắn, thêm vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3775, 57, 'たまる', 'たまる', 'được tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3776, 57, 'ためる', 'ためる', 'tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3777, 57, 'まじる', '交じる・混じる', 'giao vào, lẫn vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3778, 57, 'まざる', '交ざる・混ざる', 'được trộn lẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3779, 57, 'まぜる', '交ぜる・混ぜる', 'trộn vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3780, 57, 'とける', '解ける・溶ける', 'được giải quyết, nóng chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3781, 57, 'とく', '解く・溶く', 'giải quyết, nóng chảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3782, 57, 'ふくむ', '含む', 'chứa, bao gồm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3783, 57, 'ふくめる', '含める', 'bao gồm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3784, 57, 'ぬける', '抜ける', 'tháo, tuột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3785, 57, 'ぬく', '抜く', 'lấy ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3786, 57, 'あらわれる', '現れる', 'xuất hiện, được thẻ hiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3787, 57, 'あらわす', '現す', 'xuất hiện, hiện ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3788, 57, 'あらわれる', '表れる', 'biểu hiện (trên mặt)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3789, 57, 'あらわす', '表す', 'biểu thị, biểu lộ, đại diện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3790, 57, 'ちる', '散る', 'bị tàn, rụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3791, 57, 'ちらす', '散らす', 'tàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3792, 57, 'あける', '明ける', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3793, 57, 'さす', '差す', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3794, 57, '', 'パートナ', 'đối tác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3795, 57, '', 'リーダー', 'lãnh đạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3796, 57, '', 'ボランティア', 'tình nguyện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3797, 57, '', 'コミュニケーション', 'giao tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3798, 57, '', 'ユーモア', 'hài hước, đùa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3799, 57, '', 'ショック', 'shock, choáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3800, 57, '', 'ストレス', 'căng thẳng, stress', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3801, 57, '', 'バランス', 'cân bằng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3802, 57, '', 'レベル', 'trình độ, level', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3803, 57, '', 'アップ', 'tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3804, 57, '', 'ダウン', 'giảm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3805, 57, '', 'プラス', 'phép cộng, tác động tích cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3806, 57, '', 'マイナス', 'phép trừ, tác động tiêu cực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3807, 57, '', 'イメージ', 'hình ảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3808, 57, '', 'コンテスト', 'cuộc thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3809, 57, '', 'マスコミ', 'thông tin truyền thông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3810, 57, '', 'プライバシー', 'cá nhân, riêng tư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3811, 57, '', 'オフィス', 'văn phòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3812, 57, '', 'ルール', 'luật lệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3813, 57, '', 'マナー', 'kiểu, thói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3814, 57, '', 'ミス', 'lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3815, 57, '', 'スケジュール', 'lịch, kế hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3816, 57, '', 'タイトル', 'tiêu đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3817, 57, '', 'テーマ', 'chủ đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3818, 57, '', 'ストーリー', 'câu chuyện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3819, 57, '', 'ヒット', 'nổi tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3820, 57, '', 'ブランド', 'nhãn hiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3821, 57, '', 'レンタル', 'thuê', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3822, 57, '', 'リサイクル', 'tái chế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3823, 57, '', 'ラベル', 'nhãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3824, 57, '', 'タイプ', 'loại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3825, 57, '', 'スタイル', 'kiểu dáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3826, 57, '', 'セット', 'cài đặt, set', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3827, 57, '', 'ウイルス', 'virus', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3828, 57, '', 'ロボット', 'robot', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3829, 57, '', 'エネルギー', 'năng lượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3830, 57, '', 'デジタル', 'kỹ thuật số', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3831, 57, '', 'マイク', 'microphone, ghi âm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3832, 57, '', 'ブレーキ', 'phanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3833, 57, '', 'ペンキ', 'sơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3834, 57, 'たける', '炊ける', 'được nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3835, 57, 'たく', '炊く', 'nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3836, 57, 'にえる', '煮える', 'được nấu, được ninh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3837, 57, 'にる', '煮る', 'nấu, ninh, luộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3838, 57, 'いためる', '炒める', 'rán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3839, 57, 'やける', '焼ける', 'được nấu, được nướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3840, 58, 'やく', '焼く', 'nướng, nấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3841, 58, 'ゆでる', 'ゆでる', 'luộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3842, 58, 'あげる', '揚げる', 'rán ngập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3843, 58, 'むす', '蒸す', 'hấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3844, 58, 'ぐっすり', 'ぐっすり', 'say', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3845, 58, 'きちんと', 'きちんと', 'ngay ngắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3846, 58, 'しっかり', 'しっかり', 'kiên quyết, chắc chắn, đáng tin cậy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3847, 58, 'はっきり', 'はっきり', 'rõ ràng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3848, 58, 'じっと', 'じっと', 'kiên nhẫn, chăm chú, chằm chằm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3849, 58, 'そっと', 'そっと', 'nhẹ nhàng, yên lặng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3850, 58, 'べつべつに', '別々に', 'riêng biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3851, 58, 'それぞれ', 'それぞれ', 'lần lượt, tương ứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3852, 58, 'たがいに', '互いに', 'lẫn nhau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3853, 58, 'ちょくせつ', '直接', 'trực tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3854, 58, 'ほんとうに', '本当に', 'thật lòng, kỳ thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3855, 58, 'かならず', '必ず', 'chắc chắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3856, 58, 'ぜったいに', '絶対に', 'chắc chắn rồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3857, 58, 'とくに', '特に', 'đặc biệt là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3858, 58, 'ただ', 'ただ', 'chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3859, 58, 'すくなくとも', '少なくとも', 'ít nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3860, 58, 'けっして', '決して', 'không bao giờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3861, 58, 'すこしも', '少しも', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3862, 58, 'ちっとも', 'ちっとも', '(không) tí gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3863, 58, 'まったく', '全く', 'hoàn toàn (không)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3864, 58, 'とても', 'とても', 'rất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3865, 58, 'どんなに', 'どんなに', 'thế nào, bao nhiêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3866, 58, 'どうしても', 'どうしても', 'kiểu gì cũng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3867, 58, 'まるで', 'まるで', 'như là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3868, 58, 'いったい', '一体', 'cái quái gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3869, 58, 'べつに', '別に', '(không) có gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3870, 58, 'たった', 'たった', 'chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3871, 58, 'ほんの', 'ほんの', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3872, 58, 'それで', 'それで', 'thế thì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3873, 58, 'そこで', 'そこで', 'tiếp theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3874, 58, 'そのうえ', 'そのうえ', 'hơn nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3875, 58, 'また', 'また', 'nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3876, 58, 'または', 'または', 'hoặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3877, 58, 'それとも', 'それとも', 'hoặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (3878, 58, 'つまり', 'つまり', 'nói cách khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5000, 59, 'じんせい', '人生', 'cuộc sống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5001, 59, 'にんげん', '人間', 'con người', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5002, 59, 'ひと', '人', 'người', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5003, 59, 'そせん', '祖先', 'tổ tiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5004, 59, 'しんせき', '親戚', 'họ hàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5005, 59, 'ふうふ', '夫婦', 'vợ chồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5006, 59, 'ちょうなん', '長男', 'trưởng nam', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5007, 59, 'しゅじん', '主人', 'chồng, chủ tiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5008, 59, 'ふたご', '双子', 'sinh đôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5009, 59, 'まいご', '迷子', 'trẻ bị lạc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5010, 59, 'たにん', '他人', 'người khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5011, 59, 'てき', '敵', 'kẻ thù', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5012, 59, 'みかた', '味方', 'bạn bè, đồng minh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5013, 59, 'ひっしゃ', '筆者', 'tác giả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5014, 59, 'じゅみょう', '寿命', 'tuổi thọ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5015, 59, 'しょうらい', '将来', 'tương lai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5016, 59, 'さいのう', '才能', 'tài năng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5017, 59, 'のうりょく', '能力', 'năng lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5018, 59, 'ちょうしょ', '長所', 'sở trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5019, 59, 'こせい', '個性', 'cá tính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5020, 59, 'いでん', '遺伝', 'di truyền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5021, 59, 'どうさ', '動作', 'động tác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5022, 59, 'まね', '真似', 'bắt chước, copy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5023, 59, 'すいみん', '睡眠', 'ngủ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5024, 59, 'しょくよく', '食欲', 'thèm ăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5025, 59, 'がいしょく', '外食', 'ăn ngoài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5026, 59, 'かじ', '家事', 'việc nhà', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5027, 59, 'しゅっさん', '出産', 'sinh đẻ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5028, 59, 'かいご', '介護', 'chăm sóc, trông nom', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5029, 59, 'ともばたらき', '共働き', 'vợ chồng cùng làm việc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5030, 59, 'しゅっきん', '出勤', 'đi làm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5031, 59, 'しゅっせ', '出世', 'thành đạt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5032, 59, 'ちい', '地位', 'địa vị, vị trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5033, 59, 'じゅけん', '受験', 'kì thi, tham gia kỳ thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5034, 59, 'せんこう', '専攻', 'chuyên ngành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5035, 59, 'したく', '支度', 'chuẩn bị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5036, 59, 'ぜんしん', '全身', 'toàn bộ cơ thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5037, 59, 'しわ', 'しわ', 'nếp nhăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5038, 59, 'ふくそう', '服装', 'quần áo, trang phục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5039, 59, 'れい', '礼', 'lễ, cảm ơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5040, 59, 'せじ', '世辞', 'nịnh, ca tụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5041, 59, 'いいわけ', '言い訳', 'lý do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5042, 59, 'わだい', '話題', 'chủ đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5043, 59, 'ひみつ', '秘密', 'bí mật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5044, 59, 'そんけい', '尊敬', 'tôn trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5045, 59, 'けんそん', '謙そん', 'khiên tốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5046, 59, 'きたい', '期待', 'mong chờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5047, 59, 'くろう', '苦労', 'lo lắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5048, 59, 'いし', '意志', 'ý chí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5049, 59, 'かんじょう', '感情', 'biểu cảm, tôn tọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5050, 59, 'ざいりょう', '材料', 'nguyên liệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5051, 59, 'いし', '石', 'đá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5052, 59, 'ひも', 'ひも', 'dây', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5053, 59, 'けん', '券', 'vé', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5054, 59, 'めいぼ', '名簿', 'danh bạ, danh sách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5055, 59, 'ひょう', '表', 'bảng biểu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5056, 59, 'けり', '針', 'kim', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5057, 59, 'せん', '栓', 'nút, nắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5058, 59, 'ゆげ', '湯気', 'hơi, khí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5059, 59, 'ひあたり', '日当たり', 'nơi có ánh sáng chiếu vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5060, 59, 'から', '空', 'trống rỗng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5061, 59, 'ななめ', '斜め', 'nghiêng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5062, 59, 'りれき', '履歴', 'lý lịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5063, 59, 'ごらく', '娯楽', 'vui chơi, thú vui', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5064, 59, 'しかい', '司会', 'chủ tịch, chủ hội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5065, 59, 'かんげい', '歓迎', 'hoan nghênh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5066, 59, 'まどぐち', '窓口', 'cửa bán vé', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5067, 59, 'てつづき', '手続き', 'thủ tục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5068, 59, 'とほ', '徒歩', 'đi bộ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5069, 59, 'ちゅうしゃ', '駐車', 'bãi đỗ xe', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5070, 59, 'いはん', '違反', 'phản đối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5071, 59, 'へいじつ', '平日', 'ngày thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5072, 59, 'ひづけ', '日付', 'ngày tháng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5073, 59, 'にっちゅう', '日中', 'ban ngày', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5074, 59, 'にってい', '日程', 'lịch trình, kế hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5075, 60, 'ひがえり', '日帰り', 'đi về trong ngày', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5076, 60, 'じゅんじょ', '順序', 'thứ tự', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5077, 60, 'じき', '時期', 'thời kì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5078, 60, 'げんざい', '現在', 'hiện tại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5079, 60, 'りんじ', '臨時', 'tạm thời', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5080, 60, 'ひよう', '費用', 'chi phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5081, 60, 'ていか', '定価', 'giá cố định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5082, 60, 'わりびき', '割引', 'giảm giá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5083, 60, 'おまけ', 'おまけ', 'quà khuyến mại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5084, 60, 'むりょう', '無料', 'miễn phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5085, 60, 'げんきん', '現金', 'tiền mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5086, 60, 'ごうけい', '合計', 'tổng cộng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5087, 60, 'しゅうにゅう', '収入', 'thu nhập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5088, 60, 'ししゅつ', '支出', 'chi phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5089, 60, 'よさん', '予算', 'ngân sách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5090, 60, 'りえき', '利益', 'lợi nhuận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5091, 60, 'あかじ', '赤字', 'lỗ, thâm hụt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5092, 60, 'けいひ', '経費', 'kinh phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5093, 60, 'かんじょう', '勘定', 'tính toán, thanh toán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5094, 60, 'べんしょう', '弁償', 'bồi thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5095, 60, 'せいきゅう', '請求', 'yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5096, 60, 'けいき', '景気', 'kinh tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5097, 60, 'ぼきん', '募金', 'quyên tiền, gây quỹ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5098, 60, 'ぼしゅう', '募集', 'tuyển dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5099, 60, 'かち', '価値', 'giá trị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5100, 60, 'このむ', '好む', 'thích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5101, 60, 'きらう', '嫌う', 'ghét', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5102, 60, 'ねがう', '願う', 'ước, yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5103, 60, 'あまえる', '甘える', 'nũng nịu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5104, 60, 'かわいがる', 'かわいがる', 'yêu mến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5105, 60, 'きづく', '気付く', 'nhận ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5106, 60, 'うたがう', '疑う', 'nghi ngờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5107, 60, 'くるしむ', '苦しむ', 'khổ, chịu đựng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5108, 60, 'かなしむ', '悲しむ', 'buồn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5109, 60, 'がっかりする', 'がっかりする', 'thất vọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5110, 60, 'はげます', '励ます', 'động viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5111, 60, 'うなずく', 'うなずく', 'gật đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5112, 60, 'はりきる', '張り切る', 'hăm hở, làm việc chăm chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5113, 60, 'いばる', '威張る', 'kiêu ngạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5114, 60, 'どなる', '怒鳴る', 'hét lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5115, 60, 'あばれる', '暴れる', 'nổi giận, bạo lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5116, 60, 'しゃがむ', 'しゃがむ', 'ngồi chơi, ngồi xổm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5117, 60, 'どく', 'どく', 'làm tránh ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5118, 60, 'どける', 'どける', 'tránh ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5119, 60, 'かぶる', 'かぶる', 'đội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5120, 60, 'かぶせる', 'かぶせる', 'phủ lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5121, 60, 'かじる', 'かじる', 'nhai, cắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5122, 60, 'うつ', '撃つ', 'bắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5123, 60, 'こぐ', '漕ぐ', 'đạp xe', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5124, 60, 'しく', '敷く', 'trải ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5125, 60, 'つぐ', 'つぐ', 'đổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5126, 60, 'くばる', '配る', 'phân phát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5127, 60, 'ほうる', '放る', 'ném, bỏ mặc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5128, 60, 'ほる', '掘る', 'đào, khai quật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5129, 60, 'まく', 'まく', 'rắc, rải', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5130, 60, 'はかる', '測る・計る・量る', 'đo, đo đạc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5131, 60, 'うらなう', '占う', 'dự đoán, bói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5132, 60, 'ひっぱる', '引っ張る', 'kéo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5133, 60, 'つく', '突く', 'chọc, đâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5134, 60, 'つきあたる', '突き当たる', 'đi hết đường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5135, 60, 'たちどまる', '立ち止まる', 'dừng lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5136, 60, 'ちかよる', '近寄る', 'tiếp cận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5137, 60, 'よこぎる', '横切る', 'băng qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5138, 60, 'ころぶ', '転ぶ', 'ngã', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5139, 60, 'つまずく', 'つまずく', 'ngã, vấp ngã', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5140, 60, 'ひく', 'ひく', 'chèn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5141, 60, 'おぼれる', 'おぼれる', 'chìm, đắm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5142, 60, 'いたむ', '痛む', 'đau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5143, 60, 'かかる', 'かかる', 'bị nhiễm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5144, 60, 'よう', 'よう', 'say', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5145, 60, 'はく', '吐く', 'thở ra, nôn ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5146, 60, 'みる', '診る', 'chuẩn đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5147, 60, 'みまう', '見舞う', 'đi thăm bệnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5148, 60, 'つとめる', '勤める', 'làm việc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5149, 60, 'かせぐ', '稼ぐ', 'kiếm tiền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5150, 61, 'しはらう', '支払う', 'trả tiền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5151, 61, 'うけとる', '受け取る', 'nhận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5152, 61, 'はらいこむ', '払い込む', 'trả vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5153, 61, 'はらいもどす', '払い戻す', 'trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5154, 61, 'ひきだす', '引き出す', 'rút ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5155, 61, 'もうかる', 'もうかる', 'có lợi nhuận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5156, 61, 'もうける', 'もうける', 'kiếm lợi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5157, 61, 'おちこむ', '落ち込む', 'giảm, rơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5158, 61, 'うれる', '売れる', 'bán chạy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5159, 61, 'うりきれる', '売り切れる', 'bán sạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5160, 61, 'くっつく', 'くっ付く', 'gắn vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5161, 61, 'くっつける', 'くっ付ける', 'dính vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5162, 61, 'かたまる', '固まる', 'cứng lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5163, 61, 'かためる', '固める', 'làm cứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5164, 61, 'ちぢむ', '縮む', 'ngắn lại, co lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5165, 61, 'ちぢまる', '縮まる', 'làm ngắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5166, 61, 'ちぢめる', '縮める', 'làm ngắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5167, 61, 'しずむ', '沈む', 'chìm, lặn, bị nhấn xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5168, 61, 'しずめる', '沈める', 'chìm, lặn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5169, 61, 'さがる', '下がる', 'rơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5170, 61, 'さげる', '下げる', 'giảm bớt, hạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5171, 61, 'ころがる', '転がる', '(tự)lăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5172, 61, 'ころがす', '転がす', 'lăn(vật gì đó)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5173, 61, 'かたむく', '傾く', 'nghiêng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5174, 61, 'かたむける', '傾ける', 'hướng vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5175, 61, 'うらがえす', '裏返す', 'lật úp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5176, 61, 'ちらかる', '散らかる', 'bừa bộn, trong mớ hỗn độn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5177, 61, 'ちらかす', '散らかす', 'lung tung, vương vãi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5178, 61, 'ちらばる', '散らばる', 'vứt lung tung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5179, 61, 'きざむ', '刻む', 'cắt nhỏ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5180, 61, 'はさまる', '挟まる', 'bị kẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5181, 61, 'はさむ', '挟む', 'kẹp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5182, 61, 'つぶれる', 'つぶれる', 'bị hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5183, 61, 'つぶす', 'つぶす', 'làm hỏng, giết(thời gian)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5184, 61, 'へこむ', 'へこむ', 'lõm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5185, 61, 'ほどける', 'ほどける', 'mở, cởi ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5186, 61, 'ほどく', 'ほどく', 'cởi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5187, 61, 'かれる', '枯れる', 'bị héo, bị tàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5188, 61, 'からす', '枯らす', 'héo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5189, 61, 'いたむ', '傷む', 'bị hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5190, 61, 'しめる', '湿る', 'bị ẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5191, 61, 'こおる', '凍る', 'đông cứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5192, 61, 'ふるえる', '震える', 'run rẩy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5193, 61, 'かがやく', '輝く', 'sáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5194, 61, 'あふれる', 'あふれる', 'tràn, đầy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5195, 61, 'あまる', '余る', 'còn sót lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5196, 61, 'めだつ', '目立つ', 'nổi bật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5197, 61, 'みおろす', '見下ろす', 'nhìn xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5198, 61, 'たたかう', '戦う/闘う', 'đánh nhau, tranh chấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5199, 61, 'やぶれる', '敗れる', 'bị đánh bại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5200, 61, 'にげる', '逃げる', 'chạy trốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5201, 61, 'にがす', '逃がす', 'thả ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5202, 61, 'もどる', '戻る', 'quay lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5203, 61, 'もどす', '戻す', 'để trả lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5204, 61, 'はまる', 'はまる', 'khớp, bị kẹt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5205, 61, 'はめる', 'はめる', 'làm chặt lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5206, 61, 'あつかう', '扱う', 'đối xử, xử lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5207, 61, 'かかわる', '関わる', 'liên quan', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5208, 61, 'めざす', '目指す', 'hướng đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5209, 61, 'たつ', '立つ・発つ', 'khởi hành, rời khỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5210, 61, 'むかえる', '迎える', 'đón', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5211, 61, 'もてる', '持てる', 'phổ biến, được yêu thích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5212, 61, 'たとえる', '例える', 'ví như, so với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5213, 61, 'つとめる', '努める', 'nỗ lực, cố gắng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5214, 61, 'つとまる', '務まる', 'hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5215, 61, 'つとめる', '務める', 'phục vụ, làm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5216, 61, 'とりけす', '取り消す', 'hủy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5217, 61, 'おえる', '終える', 'kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5218, 61, 'よぶかける', '呼びかける', 'gọi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5219, 61, 'よぶだす', '呼び出す', 'triệu hồi, triệu tập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5220, 61, 'ありがたい', '有難い', 'cảm ơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5221, 61, 'もうしわけない', '申し訳ない', 'xin lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5222, 61, 'めでたい', 'めでたい', 'vui, hạnh phúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5223, 61, 'さいわいな', '幸いな', 'hạnh phúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5224, 61, 'こいしい', '恋しい', 'nhớ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5225, 62, 'なつかしい', '懐かしい', 'thân thiết, nhớ nhà', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5226, 62, 'おさない', '幼い', 'non nớt, bé', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5227, 62, 'こころぼそい', '心細い', 'cô đơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5228, 62, 'かわいそうな', 'かわいそうな', 'tội nghiệp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5229, 62, 'きのどくな', '気の毒な', 'đáng tiếc, đáng thương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5230, 62, 'まずしい', '貧しい', 'nghèo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5231, 62, 'おしい', '惜しい', 'đáng tiếc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5232, 62, 'しかた（が）ない', '仕方（が）ない', 'vô phương, bó tay', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5233, 62, 'やむをえない', 'やむを得ない', 'không tránh khỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5234, 62, 'めんどうくさい', '面倒くさい', 'phiền toái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5235, 62, 'しつこい', 'しつこい', 'lằng nhằng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5236, 62, 'くどい', 'くどい', 'dài dòng, lắm lời', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5237, 62, 'けむい', '煙い', 'nhiều khói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5238, 62, 'じゃまな', '邪魔な', 'vướng víu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5239, 62, 'うるさい', 'うるさい', 'ồn ào, om sòm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5240, 62, 'そうぞうしい', '騒々しい', 'ồn ào, sôi nổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5241, 62, 'あわただしい', '慌ただしい', 'vội vã, cuống cuồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5242, 62, 'そそっかしい', 'そそっかしい', 'vô tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5243, 62, 'おもいがけない', '思いがけない', 'không ngờ đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5244, 62, 'なにげない', '何気ない', 'ngẫu nhiên, tình cờ, không cố ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5245, 62, 'とんでもない', 'とんでもない', 'không thể tin được', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5246, 62, 'くだらない', 'くだらない', 'vô giá trị, vô nghĩa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5247, 62, 'ばかばかしい', 'ばかばかしい', 'buồn cười, ngu ngốc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5248, 62, 'でたらめな', 'でたらめな', 'bừa, linh tinh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5249, 62, 'だらしない', 'だらしない', 'không gọn gàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5250, 62, 'ずうずうしい', 'ずうずうしい', 'vô liêm sỉ, trơ trẽn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5251, 62, 'ずるい', 'ずるい', 'không trung thực, láu cá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5252, 62, 'にくらしい', '憎らしい', 'đáng ghét, ghê tởm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5253, 62, 'にくい', '憎い', 'căm thù, ghét', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5254, 62, 'けわしい', '険しい', 'dốc, nghiêm khắc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5255, 62, 'つらい', '辛い', 'đau đớn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5256, 62, 'きつい', 'きつい', 'khó khăn, mệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5257, 62, 'ゆるい', '緩い', 'lỏng, chậm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5258, 62, 'にぶい', '鈍い', 'cùn, đần độn, kém', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5259, 62, 'するどい', '鋭い', 'sắc, sắc sảo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5260, 62, 'あらい', '荒い・粗い', 'bạo lực, khốc liệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5261, 62, 'ごういんな', '強引な', 'cưỡng bức, bắt buộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5262, 62, 'かってな', '勝手な', 'độc đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5263, 62, 'つよきな', '強気な', 'kiên định, vững vàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5264, 62, 'がんこな', '頑固な', 'bảo thủ, cố chấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5265, 62, 'かじょうな', '過剰な', 'vượt quá, dư thừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5266, 62, 'じゅうたいな', '重大な', 'nghiêm trọng, nguy kịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5267, 62, 'しんこくな', '深刻な', 'nghiêm trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5268, 62, 'きらくな', '気楽な', 'thoải mái, nhàn hạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5269, 62, 'あんいな', '安易な', 'dễ dàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5270, 62, 'うん', '運', 'số, vận mệnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5271, 62, 'かん', '勘', 'trực giác, linh cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5272, 62, 'かんかく', '感覚', 'cảm giác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5273, 62, 'しんけい', '神経', 'thần kinh, nhạy cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5274, 62, 'きおく', '記憶', 'ký ức, trí nhớ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5275, 62, 'ようす', '様子', 'trạng thái, tình trạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5276, 62, 'ふんいき', '雰囲気', 'bầu không khí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5277, 62, 'みりょく', '魅力', 'mị lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5278, 62, 'きげん', '機嫌', 'tâm trạng, sức khỏe', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5279, 62, 'かんしん', '感心', 'quan tâm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5280, 62, 'いよく', '意欲', 'ý dục, muốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5281, 62, 'ぜんりょく', '全力', 'toàn lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5282, 62, 'ほんき', '本気', 'nghiêm chỉnh, chân thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5283, 62, 'いしき', '意識', 'ý thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5284, 62, 'かんげき', '感激', 'cảm kích, xúc động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5285, 62, 'どうじょう', '同情', 'cảm thông, đồng cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5286, 62, 'どうい', '同意', 'đồng ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5287, 62, 'どうかん', '同感', 'đổng cảm, cùng ý kiến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5288, 62, 'たいりつ', '対立', 'đối lập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5289, 62, 'しゅちょう', '主張', 'chủ trương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5290, 62, 'ようきゅう', '要求', 'yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5291, 62, 'とく', '得', 'lợi ích, lãi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5292, 62, 'そん', '損', 'lỗ, tổn thất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5293, 62, 'しょうぶ', '勝負', 'đánh cược', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5294, 62, 'いきおい', '勢い', 'mạnh mẽ, tràn trề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5295, 62, 'ばくはつ', '爆発', 'nổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5296, 62, 'さいがい', '災害', 'thảm họa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5297, 62, 'てんこう', '天候', 'thời tiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5298, 62, 'かんそう', '乾燥', 'sự khô khan, khô hạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5299, 62, 'かんそく', '観測', 'quan sát, dự đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5300, 63, 'そうなん', '遭難', 'thảm họa, tai nạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5301, 63, 'はっせい', '発生', 'phát sinh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5302, 63, 'とうじょう', '登場', 'lối vào, xuất hiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5303, 63, 'かいふく', '回復', 'hồi phục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5304, 63, 'えんじょ', '援助', 'viện trợ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5305, 63, 'ほけん', '保険', 'bảo hiểm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5306, 63, 'ついか', '追加', 'thêm vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5307, 63, 'おうよう', '応用', 'ứng dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5308, 63, 'かいとう', '解答', 'trả lời, hồi đáp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5309, 63, 'けつろん', '結論', 'kết luận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5310, 63, 'あん', '案', 'kế hoạch, ý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5311, 63, 'しゅうちゅう', '集中', 'tập trung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5312, 63, 'くべつ', '区別', 'phân biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5313, 63, 'さべつ', '差別', 'phân biệt (chủng tộc)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5314, 63, 'ちゅうかん', '中間', 'ở giữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5315, 63, 'ぎゃく', '逆', 'ngược lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5316, 63, 'よそ', 'よそ', 'nơi khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5317, 63, 'ほか', '外', 'người (khác), ngoài ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5318, 63, 'さかい', '境', 'biên giới, ngăn cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5319, 63, 'なかば', '半ば', 'một nửa, ở giữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5320, 63, 'ふだん', '普段', 'bình thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5321, 63, 'にちじょう', '日常', 'hàng ngày', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5322, 63, 'いっぱん', '一般', 'tổng quan, cái chung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5323, 63, 'じょうしき', '常識', 'thường thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5324, 63, 'ことわざ', 'ことわざ', 'thành ngữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5325, 63, 'けんり', '権利', 'quyền lợi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5326, 63, 'ぎむ', '義務', 'nghĩa vụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5327, 63, 'きっかけ', 'きっかけ', 'cơ hội, khởi đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5328, 63, 'こうどう', '行動', 'hành động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5329, 63, 'しよう', '使用', 'sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5330, 63, 'ていしゅつ', '提出', 'đề xuất, trình bày', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5331, 63, 'きげん', '期限', 'giới hạn, kỳ hạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5332, 63, 'えんき', '延期', 'trì hoãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5333, 63, 'えんちょう', '延長', 'kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5334, 63, 'たんしゅく', '短縮', 'rút ngắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5335, 63, 'えいぞう', '映像', 'hình ảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5336, 63, 'さつえい', '撮影', 'chụp ảnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5337, 63, 'はいけい', '背景', 'bối cảnh, phông nền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5338, 63, 'どくりつ', '独立', 'độc lập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5339, 63, 'こうほ', '候補', 'ứng cử, ứng cử viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5340, 63, 'しじ', '支持', 'hỗ trợ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5341, 63, 'とうひょう', '投票', 'bầu cử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5342, 63, 'とうせん', '当選', 'trúng cử, trúng giải', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5343, 63, 'ちゅうせん', '抽選', 'rút thăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5344, 63, 'はいふ', '配布', 'phân phát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5345, 63, 'しっかく', '失格', 'mất tư cách, mất quyền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5346, 63, 'よか', '余暇', 'thời gian rỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5347, 63, 'ぎょうじ', '行事', 'sự kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5348, 63, 'りそう', '理想', 'lý tưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5349, 63, 'げんじつ', '現実', 'hiện thực, thực tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5350, 63, 'たいけん', '体験', 'trải nghiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5351, 63, 'くうそう', '空想', 'không tưởng, kỳ diệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5352, 63, 'じつぶつ', '実物', 'thực chất, nguyên bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5353, 63, 'じつげん', '実現', 'hiện thực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5354, 63, 'じっし', '実施', 'thực thi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5355, 63, 'きょか', '許可', 'sự cho phép', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5356, 63, 'ぜんたい', '全体', 'toàn thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5357, 63, 'ぶぶん', '部分', 'bộ phận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5358, 63, 'とういつ', '統一', 'thống nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5359, 63, 'かくだい', '拡大', 'mở rộng, tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5360, 63, 'しゅくしょう', '縮小', 'co nhỏ, nén lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5361, 63, 'しゅうごう', '集合', 'tập hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5362, 63, 'ほうこう', '方向', 'phương hướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5363, 63, 'かんかく', '間隔', 'khoảng cách, khoảng giữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5364, 63, 'わき', '脇', 'phía bên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5365, 63, 'つうか', '通過', 'thông qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5366, 63, 'いどう', '移動', 'di chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5367, 63, 'ていし', '停止', 'dừng lại, tạm dừng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5368, 63, 'ていか', '低下', 'rơi xuống, từ chối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5369, 63, 'ちょうか', '超過', 'vượt quá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5370, 63, '', 'アンテナ', 'ăng ten', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5371, 63, '', 'イヤホン', 'tai nghe', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5372, 63, '', 'サイレン', 'tiếng chuông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5373, 63, '', 'コード', 'dây (điện)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5374, 63, '', 'モニター', 'mô tơ, màn hình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5375, 64, '', 'メーター', 'đồng hồ đo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5376, 64, '', 'ペア', 'một cặp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5377, 64, '', 'リズム', 'giai điệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5378, 64, '', 'アクセント', 'giọng, nhấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5379, 64, '', 'アルファベット', 'bảng chữ cái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5380, 64, '', 'アドレス', 'địa chỉ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5381, 64, '', 'メモ', 'ghi chú', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5382, 64, '', 'マーク', 'đánh dấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5383, 64, '', 'イラスト', 'minh họa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5384, 64, '', 'サイン', 'chữ kí, kí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5385, 64, '', 'スター', 'ngôi sao nổi tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5386, 64, '', 'アンコール', 'lần nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5387, 64, '', 'モデル', 'mẫu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5388, 64, '', 'サンブル', 'hàng mẫu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5389, 64, '', 'スタイル', 'kiểu cách, phong cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5390, 64, '', 'ウエスト', 'eo, vòng eo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5391, 64, '', 'カロリー', 'calo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5392, 64, '', 'オーバー', 'quá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5393, 64, '', 'コントロール', 'kiểm soát, điều khiển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5394, 64, '', 'カーブ', 'khúc cua, cong', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5395, 64, '', 'コース', 'khóa học', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5396, 64, '', 'レース', 'cuộc đua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5397, 64, '', 'リード', 'dẫn đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5398, 64, '', 'トップ', 'đầu bảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5399, 64, '', 'ゴール', 'đạt thành tích, ghi bàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5400, 64, '', 'パス', 'vượt qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5401, 64, '', 'ベスト', 'tốt nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5402, 64, '', 'レギュラー', 'bình thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5403, 64, '', 'コーチ', 'huấn luyện viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5404, 64, '', 'キャプテン', 'đội trưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5405, 64, '', 'サークル', 'vòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5406, 64, '', 'キャンパス', 'trại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5407, 64, '', 'オリエンテーション', 'định hướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5408, 64, '', 'カリキュラム', 'giáo án', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5409, 64, '', 'プログラム', 'chương trình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5410, 64, '', 'レッスン', 'bài học', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5411, 64, '', 'レクリエーション', 'giải trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5412, 64, '', 'レジャー', 'vui chơi, rảnh rỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5413, 64, '', 'ガイド', 'hướng dẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5414, 64, '', 'シーズン', 'mùa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5415, 64, '', 'ダイヤ', 'thời gian biểu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5416, 64, '', 'ウイークデー', 'ngày trong tuần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5417, 64, '', 'サービス', 'dịch vụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5418, 64, '', 'アルコール', 'cồn, rượu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5419, 64, '', 'デコレーション', 'trang trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5420, 64, 'もっとも', '最も', 'nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5421, 64, 'ほぼ', 'ほぼ', 'gần như', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5422, 64, 'そうとう', '相当', 'đáng kể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5423, 64, 'わりに・わりと・わりあい(に・と)', '割に・割と・割合(に・と)', 'tương đối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5424, 64, 'たしょう', '多少', 'một chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5425, 64, 'しょうしょう', '少々', 'một chút, khoảnh khắc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5426, 64, 'すべて', '全て', 'mọi thứ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5427, 64, 'なにもかも', '何もかも', 'toàn bộ, mọi thứ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5428, 64, 'たつぷり', 'たつぷり', 'đủ, nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5429, 64, 'できるだけ', 'できるだけ', 'càng ~ càng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5430, 64, 'しだいに', '次第に', 'dần dần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5431, 64, 'じょじょに', '徐々に', 'từng chút một', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5432, 64, 'さらに', 'さらに', 'hơn nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5433, 64, 'いっそう', '一層', 'hơn, vẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5434, 64, 'いちだんと', '一段と', 'hơn rất nhiều', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5435, 64, 'より', 'より', 'hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5436, 64, 'けっきょく', '結局', 'kết cuộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5437, 64, 'ようやく', 'ようやく', 'cuối cùng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5438, 64, 'ふたたび', '再び', 'lần nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5439, 64, 'たちまち', 'たちまち', 'ngay lập tức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5440, 64, 'こんど', '今度', 'lần tới', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5441, 64, 'こんご', '今後', 'từ bây giờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5442, 64, 'のち(に)', '後(に)', 'sau đó, tương lai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5443, 64, 'まもなく', 'まもなく', 'sắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5444, 64, 'そのうち(に)', 'そのうち(に)', 'lúc nào đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5445, 64, 'やがて', 'やがて', 'cuối cùng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5446, 64, 'いずれ', 'いずれ', 'sớm hay muộn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5447, 64, 'さきほど', '先ほど', 'mới lúc trước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5448, 64, 'とっくに', 'とっくに', 'rồi, lâu rồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5449, 64, 'すでに', 'すでに', 'rồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5450, 65, 'じぜんに', '事前に', 'trước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5451, 65, 'とうじつ', '当日', 'ngày đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5452, 65, 'とうじ', '当時', 'thời đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5453, 65, 'いちじ', '一時', 'nhất thời, có lúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5454, 65, 'しきゅう', '至急', 'khẩn cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5455, 65, 'ただちに', '直ちに', 'ngay lập tức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5456, 65, 'さっそく', '早速', 'nhanh chóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5457, 65, 'いきなり', 'いきなり', 'bất ngờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5458, 65, 'つねに', '常に', 'thường xuyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5459, 65, 'たえず', '絶えず', 'liên tục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5460, 65, 'しばしば', 'しばしば', 'rất thường xuyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5461, 65, 'たびたび', 'たびたび', 'hay, nhiều lần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5462, 65, 'しょっちゅう', 'しょっちゅう', 'luôn luôn, thường xuyên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5463, 65, 'たまに', 'たまに', 'thỉnh thoảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5464, 65, 'めったに', 'めったに', 'hiếm khi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5465, 65, 'にこにこ・にっこり', 'にこにこ・にっこり', 'cười khúc khích, cười sung sướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5466, 65, 'にやにや・にやりと', 'にやにや・にやりと', 'cười tủm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5467, 65, 'どきどき・どきりと', 'どきどき・どきりと', 'hồi hộp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5468, 65, 'はらはら', 'はらはら', 'run rẩy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5469, 65, 'かんかん', 'かんかん', 'bực mình, nóng nảy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5470, 65, 'びしょびしょ・びっしょり', 'びしょびしょ・びっしょり', 'ẩm ướt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5471, 65, 'うろうろ', 'うろうろ', 'đi lung tung, đi xung quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5472, 65, 'のろのろ', 'のろのろ', 'chậm rãi, chậm như sên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5473, 65, 'ふらふら', 'ふらふら', 'chóng mặt, hay thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5474, 65, 'ぶらぶら', 'ぶらぶら', 'quanh quẩn, ngồi không', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5475, 65, 'したがって', '従って', 'theo đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5476, 65, 'だが', 'だが', 'tuy nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5477, 65, 'ところだ', 'ところが', 'nhưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5478, 65, 'しかも', 'しかも', 'hơn nữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5479, 65, 'すると', 'すると', 'như vậy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5480, 65, 'なぜなら', 'なぜなら', 'bởi vì, vì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5481, 65, 'だって', 'だって', 'bởi vì, như', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5482, 65, 'ようするに', 'ようするに', 'tóm lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5483, 65, 'すなわち', 'すなわち', 'có nghĩa là, đó là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5484, 65, 'あるいは', 'あるいは', 'hoặc, có lẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5485, 65, 'さて', 'さて', 'nhân tiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5486, 65, 'では', 'では', 'thế thì, trong trường hợp đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5487, 65, 'ところで', 'ところで', 'nhân tiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5488, 65, 'そういえば', 'そう言えば', 'nghĩ kỹ thì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5489, 65, 'ただ', 'ただ', 'nhưng, ngoại trừ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5490, 65, 'しょくりょう', '食料・食糧', 'đồ ăn, thực phẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5491, 65, 'つぶ', '粒', 'hạt, viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5492, 65, 'くず', 'くず', 'vụn rác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5493, 65, 'さいばい', '栽培', 'nuôi trồng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5494, 65, 'しゅうかく', '収穫', 'thu hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5495, 65, 'さんち', '産地', 'nơi sản xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5496, 65, 'とち', '土地', 'đất đai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5497, 65, 'そうこ', '倉庫', 'kho', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5498, 65, 'しょゆう', '所有', 'sở hữu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5499, 65, 'しゅうしゅう', '収集', 'thu thập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5500, 65, 'たいざい', '滞在', 'ở', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5501, 65, 'べん', '便', 'thuận tiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5502, 65, 'びん', '便', 'thư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5503, 65, 'せつび', '設備', 'thiết bị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5504, 65, 'せっけい', '設計', 'thiết kế, kế hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5505, 65, 'せいさく', '制作・製作', 'chế tạo, sản xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5506, 65, 'せいぞう', '製造', 'chế tạo, sản xuất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5507, 65, 'けんちく', '建築', 'kiến thiết, xây dựng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5508, 65, 'じんこう', '人工', 'nhân tạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5509, 65, 'あつりょく', '圧力', 'áp lực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5510, 65, 'しげき', '刺激', 'kích thích, khiêu khích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5511, 65, 'まさつ', '摩擦', 'ma sát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5512, 65, 'たちば', '立場', 'lập trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5513, 65, 'やくわり', '役割', 'vai trò', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5514, 65, 'ぶんたん', '分担', 'chia sẻ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5515, 65, 'たんとう', '担当', 'chịu trách nhiệm, đảm đương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5516, 65, 'こうたい', '交代・交替', 'thay phiên, thay đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5517, 65, 'だいり', '代理', 'đại lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5518, 65, 'しんぱん', '審判', 'thẩm phám, trọng tài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5519, 65, 'かんとく', '監督', 'huấn luyện viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5520, 65, 'よそく', '予測', 'dự đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5521, 65, 'よき', '予期', 'mong đợi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5522, 65, 'はんだん', '判断', 'phán đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5523, 65, 'ひょうか', '評価', 'đánh giá, bình phẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5524, 65, 'しじ', '指示', 'chỉ dẫn, chỉ thị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5525, 66, 'むし', '無視', 'bỏ qua, ngó ngơ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5526, 66, 'むだん', '無断', 'không cho phép', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5527, 66, 'しょうち', '承知', 'hiểu, đồng ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5528, 66, 'なっとく', '納得', 'bị thuyết phục, thỏa mãn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5529, 66, 'ぎもん', '疑問', 'nghi vấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5530, 66, 'すいそく', '推測', 'phỏng đoán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5531, 66, 'こうてい', '肯定', 'khẳng định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5532, 66, 'さんこう', '参考', 'tham khảo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5533, 66, 'ていど', '程度', 'trình độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5534, 66, 'ひょうばん', '評判', 'bình luận, có tiếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5535, 66, 'ひひょう', '批評', 'xem xét, chỉ trích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5536, 66, 'すいせん', '推薦', 'tiến cử, giới thiệu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5537, 66, 'しんよう', '信用', 'tự tin, lòng tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5538, 66, 'しんらい', '信頼', 'tin tưởng, tín nhiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5539, 66, 'そんちょう', '尊重', 'tôn trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5540, 66, 'さぎょう', '作業', 'công việc, sự làm việc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5541, 66, 'くふう', '工夫', 'công sức, thiết bị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5542, 66, 'しょうか', '消化', 'tiêu hóa, tiêu thụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5543, 66, 'きゅうしゅう', '吸収', 'hấp thụ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5544, 66, 'せっち', '設置', 'cài đặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5545, 66, 'せってい', '設定', 'thiết lập, chỉnh sửa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5546, 66, 'ちょうせつ', '調節', 'điều khiển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5547, 66, 'ちょうせい', '調整', 'điều chỉnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5548, 66, 'かいほう', '解放', 'mở cửa, tự do hóa, giải phóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5549, 66, 'そうごう', '総合', 'tổng hợp, cùng nhau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5550, 66, 'れんぞく', '連続', 'liên tục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5551, 66, 'じぞく', '持続', 'kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5552, 66, 'ちゅうだん', '中断', 'gián đoạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5553, 66, 'あんてい', '安定', 'ổn định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5554, 66, 'こんらん', '混乱', 'hỗn độn, hỗn loạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5555, 66, 'じょうしょう', '上昇', 'tiến lên, tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5556, 66, 'たっせい', '達成', 'thành tựu, đạt được', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5557, 66, 'じじょう', '事情', 'tình hình, điều kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5558, 66, 'じたい', '事態', 'tình hình, tình trạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5559, 66, 'しょうがい', '障害', 'cản trở, khó khăn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5560, 66, 'ふくし', '福祉', 'phúc lợi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5561, 66, 'しゃかい', '社会', 'xã hội', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5562, 66, 'とかい', '都会', 'thành phố, thành thị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5563, 66, 'よろん', '世論', 'dư luận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5564, 66, 'みんぞく', '民族', 'dân tộc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5565, 66, 'うつる', '映る', 'bị phản chiếu, được chiếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5566, 66, 'うつす', '映す', 'chiếu, phản chiếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5567, 66, 'つかる', 'つかる', 'bị ngập, bị chìm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5568, 66, 'つける', 'つける', 'chìm xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5569, 66, 'うかぶ', '浮かぶ', 'nổi, nghĩ về, bề mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5570, 66, 'うかべる', '浮かべる', 'cho nổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5571, 66, 'うく', '浮く', 'nổi, tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5572, 66, 'もぐる', '潜る', 'nhấn chìm, ẩn giấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5573, 66, 'はねる', '跳ねる', 'nhảy, chạy qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5574, 66, 'せおう', '背負う', 'mang vác, chịu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5575, 66, 'おう', '追う', 'đuổi, theo đuổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5576, 66, 'おいかける', '追いかける', 'chạy theo, đuổi theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5577, 66, 'おいつく', '追いつく', 'đuổi kịp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5578, 66, 'おいこす', '追い越す', 'vượt qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5579, 66, 'ふりむく', '振り向く', 'nhìn quanh, chú ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5580, 66, 'とる', '捕る・採る・執る', 'lấy, tuyển dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5581, 66, 'とりあげる', '取り上げる', 'nhặt lên, lấy, chọn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5582, 66, 'とりいれる', '取り入れる', 'nhận nuôi, thu hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5583, 66, 'けずる', '削る', 'cắt xuống, giảm, làm sắc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5584, 66, 'しばる', '縛る', 'buộc, thắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5585, 66, 'しぼる', '絞る・搾る', 'vắt, bóp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5586, 66, 'まわる', '回る', 'xoay quanh, quay lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5587, 66, 'まわす', '回す', 'xoay, qua, gửi, chuyển nhượng, đầu tư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5588, 66, 'くぎる', '区切る', 'chia, nhấn mạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5589, 66, 'くむ', '組む', 'hiệp lực, tham gia, đoàn kết, vượt qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5590, 66, 'くみたてる', '組み立てる', 'lắp ráp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5591, 66, 'くわわる', '加わる', 'thêm vào, tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5592, 66, 'くわえる', '加える', 'tham gia, được cộng vào, tăng thêm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5593, 66, 'しあがる', '仕上がる', 'được kết thúc, được hoàn thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5594, 66, 'しあげる', '仕上げる', 'hoàn thành, kết thúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5595, 66, 'とおりかかる', '通りかかる', 'đi ngang qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5596, 66, 'とびまわる', '飛び回る', 'bay về, vội vàng về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5597, 66, 'めぐる', '巡る', 'quanh quanh, lặp lại, liên quan đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5598, 66, 'おぎなう', '補う', 'thêm, bổ sung', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5599, 66, 'ふせぐ', '防ぐ', 'phòng, chống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5600, 67, 'すくう', '救う', 'cứu, giúp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5601, 67, 'のぞく', '除く', 'loại trừ, bỏ qua, lấy đi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5602, 67, 'はぶく', '省く', 'bỏ sót, tiết kiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5603, 67, 'あやまる', '誤る', 'mắc lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5604, 67, 'うばう', '奪う', 'cướp đoạt, trấn lột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5605, 67, 'しまう', 'しまう', 'để lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5606, 67, 'なまける', '怠ける', 'lười biếng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5607, 67, 'うしなう', '失う', 'mất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5608, 67, 'せめる', '攻める', 'tấn công', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5609, 67, 'にらむ', 'にらむ', 'lườm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5610, 67, 'せめる', '責める', 'đổ lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5611, 67, 'うらぎる', '裏切る', 'phảm bội, thất vọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5612, 67, 'たよる', '頼る', 'dựa dẫm, dựa vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5613, 67, 'あう', '遭う', 'gặp gỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5614, 67, 'まねく', '招く', 'mời, ra dấu, gọi, nguyên nhân', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5615, 67, 'ひっかかる', '引っ掛かる', 'bị bắt, bị vướng vào, bị lừa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5616, 67, 'ひっかける', '引っ掛ける', 'mắc, lừa đảo, ném vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5617, 67, 'ひっくりかえる', 'ひっくり返る', 'đảo ngược, ngã', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5618, 67, 'ひっくりかえす', 'ひっくり返す', 'đảo ngược, lật ngửa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5619, 67, 'ずれる', 'ずれる', 'trượt, đi chệch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5620, 67, 'ずらす', 'ずらす', 'đi lạc, thay đổi, đưa ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5621, 67, 'くずれる', '崩れる', 'sụp đổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5622, 67, 'くずす', '崩す', 'phá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5623, 67, 'あれる', '荒れる', 'bão bùng, cuồng loạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5624, 67, 'あらす', '荒らす', 'tàn phá, đột phá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5625, 67, 'みとめる', '認める', 'thừa nhận, ủy quyền, xem', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5626, 67, 'みなおす', '見直す', 'nhìn lại, cân nhắc lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5627, 67, 'みなれる', '見慣れる', 'quen, nhẵn mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5628, 67, 'もとめる', '求める', 'tìm kiếm, yêu cầu, mua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5629, 67, 'もれる', '漏れる', 'rò rỉ, chạy trốn, bày tỏ, bị bỏ lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5630, 67, 'もらす', '漏らす', 'tràn, buông ra, bỏ lỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5631, 67, 'なる', 'なる', 'đỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5632, 67, 'こげる', '焦げる', 'bị cháy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5633, 67, 'はんする', '反する', 'trái lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5634, 67, 'ふくれる', '膨れる', 'phồng, sưng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5635, 67, 'ふくらむ', '膨らむ', 'to lên, tăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5636, 67, 'ふくらます', '膨らます', 'phồng, phình, được làm đầy bởi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5637, 67, 'とがる', 'とがる', 'nhọn, sắc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5638, 67, 'あてはまる', '当てはまる', 'áp dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5639, 67, 'つく', '就く', 'kiếm việc, trở thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5640, 67, 'うけもつ', '受け持つ', 'đảm trách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5641, 67, 'したがう', '従う', 'theo đó, theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5642, 67, 'つぶやく', 'つぶやく', 'thì thầm, thì thào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5643, 67, 'のべる', '述べる', 'phát biểu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5644, 67, 'めざめる', '目覚める', 'thức giấc, mở mắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5645, 67, 'かぎる', '限る', 'không nhất thiết, là tốt nhất, nhân dịp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5646, 67, 'かたよる', '片寄る・偏る', 'dồn về một phía', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5647, 67, 'うすまる', '薄まる', 'suy nhược', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5648, 67, 'うすめる', '薄める', 'pha loãng, suy yếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5649, 67, 'うすれる', '薄れる', 'trở nên mờ nhạt, phai màu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5650, 67, 'すきとおる', '透き通る', 'trở nên rõ ràng, trở nên trong suốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5651, 67, 'しずまる', '静まる・鎮まる', 'trở nên yên lặng, được bình tĩnh lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5652, 67, 'しずめる', '静める・鎮める', 'yên tĩnh, hạ hỏa, giải tỏa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5653, 67, 'すぐれる', '優れる', 'giỏi, ưu tú, hoàn hảo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5654, 67, 'おちつく', '落ち着く', 'giữ bình tĩnh, không phô trương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5655, 67, 'ながびく', '長引く', 'được kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5656, 67, 'おとろえる', '衰える', 'trở nên yếu, từ chối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5657, 67, 'そなわる', '備わる', 'được trang bị, được ưu đãi với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5658, 67, 'そなえる', '備える', 'chuẩn bị, trang bị, cung cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5659, 67, 'たくわえる', '蓄える', 'dự trữ, tiết kiệm, có trữ lượng lớn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5660, 67, 'ととのう', '整う', 'đã sẵn sàng, được chuẩn bị tốt,', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5661, 67, 'ととのえる', '整える・調える', 'chuẩn bị, sửa, điều chỉnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5662, 67, 'おおう', '覆う', 'phủ, bao bọc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5663, 67, 'てる', '照る', 'chiếu sáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5664, 67, 'てらす', '照らす', 'được chiếu sáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5665, 67, 'そまる', '染まる', 'được nhuộm, bị ảnh hưởng bởi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5666, 67, 'そめる', '染める', 'nhuộm, đỏ mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5667, 67, 'ダブる', 'ダブる', 'gấp đôi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5668, 67, 'あこがれる', 'あこがれる', 'mong ước, mơ ước', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5669, 67, 'うらやむ', 'うらやむ', 'đố kỵ, ghen tị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5670, 67, 'あきらめる', 'あきらめる', 'từ bỏ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5671, 67, 'あきれる', 'あきれる', 'bị shock, ngạc nhiên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5672, 67, 'おそれる', '恐れる', 'sợ, dữ tợn, khủng khiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5673, 67, 'うらむ', '恨む', 'hận, căm thù', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5674, 67, 'なぐさめる', '慰める', 'an ủi, động viên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5675, 68, '', 'インテリア', 'nội thất, trang trí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5676, 68, '', 'コーナー', 'góc, phần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5677, 68, '', 'カウンター', 'quầy tính tiền, bar', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5678, 68, '', 'スペース', 'khoảng trống, phòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5679, 68, '', 'オープン', 'mở, mở cửa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5680, 68, '', 'センター', 'trung tâm, ở giữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5681, 68, '', 'カルチャー', 'văn hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5682, 68, '', 'ブーム', 'bùng nổ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5683, 68, '', 'インフォメーション', 'thông tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5684, 68, '', 'キャッチ', 'bắt lấy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5685, 68, '', 'メディア', 'truyền thông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5686, 68, '', 'コメント', 'bình luận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5687, 68, '', 'コラム', 'cột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5688, 68, '', 'エピソード', 'tập, chuyện vặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5689, 68, '', 'アリバイ', 'ngoại phạm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5690, 68, '', 'シリーズ', 'loạt, chuỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5691, 68, '', 'ポイント', 'điểm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5692, 68, '', 'キー', 'chìa khóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5693, 68, '', 'マスター', 'bậc thầy, giỏi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5694, 68, '', 'ビジネス', 'kinh doanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5695, 68, '', 'キャリア', 'nghề nghiệp, vận chuyển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5696, 68, '', 'ベテラン', 'chuyên gia, có kinh nghiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5697, 68, '', 'フリー', 'tự do, độc thân, làm tự do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5698, 68, '', 'エコノミー', 'nền kinh tế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5699, 68, '', 'キャッシュ', 'tiền mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5700, 68, '', 'インフレ', 'lạm phát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5701, 68, '', 'デモ', 'cuộc biểu tình, thuyết minh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5702, 68, '', 'メーカー', 'nhà chế tạo, nhà sản xuất, nghệ sĩ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5703, 68, '', 'システム', 'hệ thống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5704, 68, '', 'ケース', 'trường hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5705, 68, '', 'パターン', 'mẫu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5706, 68, '', 'プラン', 'kế hoạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5707, 68, '', 'トラブル', 'rắc rối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5708, 68, '', 'エラー', 'lỗi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5709, 68, '', 'クレーム', 'phàn nàn, phản đói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5710, 68, '', 'キャンセル', 'hủy bỏ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5711, 68, '', 'ストップ', 'dừng lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5712, 68, '', 'カット', 'cắt bớt, giảm bớt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5713, 68, '', 'カバー', 'bao bọc, che', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5714, 68, '', 'リハビリ', 'sự phục hồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5715, 68, '', 'プレッシャー', 'sức ép', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5716, 68, '', 'カウンセリング', 'tư vấn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5717, 68, '', 'キャラクター', 'nhân cách, tính cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5718, 68, '', 'ユニークな', 'độc nhất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5719, 68, '', 'ルーズな', 'luộm thuộm, không đúng giờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5720, 68, '', 'ロマンチックな', 'lãng mạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5721, 68, '', 'センス', 'giác quan, cảm nhận', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5722, 68, '', 'エコロジー', 'sinh thái học', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5723, 68, '', 'ダム', 'đê', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5724, 68, '', 'コンクリート', 'bê tông', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5725, 68, 'たんじゅんな', '単純', 'đơn giản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5726, 68, 'じゅんすいな', '純粋な', 'trong sáng, nguyên chất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5727, 68, 'とうめいな', '透明な', 'trong suốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5728, 68, 'さわやかな', 'さわやかな', 'sảng khoái, tươi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5729, 68, 'すなおな', '素直な', 'vâng lời, dịu dàng, ôn hòa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5730, 68, 'そっちょくな', '率直な', 'trực tính, thẳng thắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5731, 68, 'せいじつな', '誠実な', 'thật thà', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5732, 68, 'けんきょな', '謙虚な', 'khiêm tốn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5733, 68, 'かしこい', '賢い', 'thông minh, khôn ngoan', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5734, 68, 'しんちょうな', '慎重な', 'khôn ngoan, dè dặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5735, 68, 'おだやかな', '穏やかな', 'điềm tĩnh, yên lặng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5736, 68, 'しんけんな', '真剣な', 'nghiêm túc, nghiêm trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5737, 68, 'せいしきな', '正式な', 'chính thức, trang trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5738, 68, 'おもな', '主な', 'chính, chủ yếu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5739, 68, 'しゅような', '主要な', 'chủ yếu, chính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5740, 68, 'きちょうな', '貴重な', 'quý giá', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5741, 68, 'いだいな', '偉大な', 'vĩ đại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5742, 68, 'えらい', '偉い', 'đáng ngưỡng mộ, vị trí cao', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5743, 68, 'どくとくな', '独特な', 'độc nhất, đặc biệt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5744, 68, 'とくしゅな', '特殊な', 'độc đáo, riêng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5745, 68, 'きみょうな', '奇妙な', 'kỳ lạ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5746, 68, 'みょうな', '妙な', 'lạ, tò mò', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5747, 68, 'あやしい', '怪しい', 'đáng nghi, nghi ngờ, không chắc chắn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5748, 68, 'いじょうな', '異常なし', 'bất thường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5749, 68, 'こうどな', '高度な', 'độ chính xác cao', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5750, 69, 'あらたな', '新たな', 'mới, được làm mới', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5751, 69, 'ごうりてきな', '合理的な', 'hợp lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5752, 69, 'きような', '器用な', 'lanh tay, tài giỏi, khéo léo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5753, 69, 'てがるな', '手軽な', 'nhẹ nhàng, đơn giản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5754, 69, 'てごろな', '手ごろな', 'hợp lý, phù hợp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5755, 69, 'こうかな', '高価な', 'đắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5756, 69, 'ぜいたくな', 'ぜいたくな', 'sang trọng, lãng phí', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5757, 69, 'ごうかな', '豪華な', 'sang trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5758, 69, 'こうきゅうな', '高級な', 'chất lượng cao, đắt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5759, 69, 'じょうとうな', '上等な', 'thượng đẳng, đủ tốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5760, 69, 'じょうひんな', '上品な', 'thượng phẩm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5761, 69, 'てきどな', '適度な', 'thích hợp, vừa phải', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5762, 69, 'かいてきな', '快適な', 'dễ chịu, sảng khoái', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5763, 69, 'こころよい', '快い', 'hài lòng, dễ chịu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5764, 69, 'じゅんちょうな', '順調な', 'thuận tiện, thỏa đáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5765, 69, 'かっぱつな', '活発な', 'hoạt bát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5766, 69, 'てきかくな', '的確な', 'chính xác, xác đáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5767, 69, 'かくじつな', '確実な', 'chắc chắn, nhất định', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5768, 69, 'あきらかな', '明らかな', 'rõ ràng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5769, 69, 'あいまいな', 'あいまいな', 'mơ hồ, không rõ ràng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5770, 69, 'ぐたいてきな', '具体的な', 'cụ thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5771, 69, 'ちゅうしょうてきな', '抽象的な', 'trừu tượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5772, 69, 'ひとしい', '等しい', 'bằng nhau, bình đẳng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5773, 69, 'びょうどうな', '平等な', 'bình đẳng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5774, 69, 'こうへいな', '公平な', 'công bằng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5775, 69, 'じんぶつ', '人物', 'nhân vật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5776, 69, 'もの', '者', 'người, kẻ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5777, 69, 'かくじ', '各自', 'mỗi người', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5778, 69, 'きぶん', '気分', 'tâm tư, tinh thần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5779, 69, 'けはい', '気配', 'cảm giác, linh cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5780, 69, 'いきがい', '生きがい', 'mục đích sống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5781, 69, 'ぎょうぎ', '行儀', 'tác phong, cách cư xử', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5782, 69, 'ひん', '品', 'hàng hóa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5783, 69, 'すがた', '姿', 'hình ảnh, bóng dáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5784, 69, 'しせい', '姿勢', 'tư thế, thái độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5785, 69, 'みかけ', '見かけ', 'ngoại hình, nhìn có vẻ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5786, 69, 'ふり', 'ふり', 'đơn sơ, giả vờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5787, 69, 'くじょう', '苦情', 'phàn nàn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5788, 69, 'こうじつ', '口実', 'xin lỗi, bào chữa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5789, 69, 'どうき', '動機', 'động cơ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5790, 69, 'ひにく', '皮肉', 'giễu cợt, mỉa mai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5791, 69, 'いぎ', '意義', 'ý nghĩa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5792, 69, 'しゅぎ', '主義', 'nguyên tắc, niềm tin', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5793, 69, 'せいしん', '精神', 'tinh thần', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5794, 69, 'ねんだい', '年代', 'kỷ nguyên, giai đoạn, thế hệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5795, 69, 'せだい', '世代', 'thời đại , thế hệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5796, 69, 'きそ', '基礎', 'cơ bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5797, 69, 'きじゅん', '基準', 'tiêu chuẩn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5798, 69, 'ひょうじゅん', '標準', 'tiêu chuẩn, cấp bậc, trung bình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5799, 69, 'てんけい', '典型', 'điển hình, mô hình', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5800, 69, 'ほうげん', '方言', 'tiếng địa phương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5801, 69, 'ぶんぷ', '分布', 'phân phối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5802, 69, 'はってん', '発展', 'phát triển, mở rộng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5803, 69, 'ぶんめい', '文明', 'văn minh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5804, 69, 'ふきゅう', '普及', 'lan tràn, khuếch tán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5805, 69, 'せいげん', '制限', 'hạn chế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5806, 69, 'げんど', '限度', 'hạn chế, có giới hạn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5807, 69, 'げんかい', '限界', 'giới hạn, ranh giới', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5808, 69, 'けんとう', '検討', 'nghiên cứu, xem xét', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5809, 69, 'せんたく', '選択', 'lựa chọn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5810, 69, 'こうりょ', '考慮', 'xem xét', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5811, 69, 'じゅうし', '重視', 'xem xét, suy tính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5812, 69, 'けんとう', '見当', 'phỏng đoná, ước tính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5813, 69, 'ていせい', '訂正', 'đính chính', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5814, 69, 'しゅうせい', '修正', 'chỉnh sửa, sửa đổi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5815, 69, 'はんこう', '反抗', 'chống, không vâng lời', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5816, 69, 'ていこう', '抵抗', 'đẩy lui, chống đối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5817, 69, 'さいなん', '災難', 'tai nạn, thiên tai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5818, 69, 'おせん', '汚染', 'ô nhiễm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5819, 69, 'がい', '害', 'có hại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5820, 69, 'でんせん', '伝染', 'truyền nhiễm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5821, 69, 'たいさく', '対策', 'đối sách, biện pháp đối phó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5822, 69, 'しょち', '処置', 'biện pháp, xử lý, điều trị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5823, 69, 'しょぶん', '処分', 'tiêu hủy, trừng trị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5824, 69, 'しょり', '処理', 'xử lý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5825, 70, 'わ', '輪', 'vòng, lặp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5826, 70, 'でこぼこ', 'でこぼこ', 'lồi lõm, ổ gà', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5827, 70, 'あと', '跡', 'dấu vết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5828, 70, 'てま', '手間', 'thời gian, phiền phức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5829, 70, 'のうりつ', '能率', 'hiệu quả, năng suất', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5830, 70, 'せいのう', '性能', 'hiệu năng, hiệu quả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5831, 70, 'そうさ', '操作', 'thao tác hoạt động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5832, 70, 'はっき', '発揮', 'phát huy, gắng sức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5833, 70, 'ちょうてん', '頂点', 'đỉnh, điểm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5834, 70, 'しゅうへん', '周辺', 'xung quanh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5835, 70, 'げんば', '現場', 'hiện trường', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5836, 70, 'じょうきょう', '状況', 'trạng thái, tình trạng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5837, 70, 'そしき', '組織', 'tổ chức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5838, 70, 'せいど', '制度', 'chế độ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5839, 70, 'こうせい', '構成', 'cấu thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5840, 70, 'けいしき', '形式', 'hình thức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5841, 70, 'けいこう', '傾向', 'khuynh hướng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5842, 70, 'ほうしん', '方針', 'phương châm, chính sách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5843, 70, 'てってい', '徹底', 'triệt để', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5844, 70, 'ぶんせき', '分析', 'phân tích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5845, 70, 'いじ', '維持', 'duy trì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5846, 70, 'かんり', '管理', 'quản lý, điều hành, điều khiển', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5847, 70, 'ゆくえ', '行方', 'tung tích, tương lai', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5848, 70, 'はし', '端', 'cạnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5849, 70, 'ば', '場', 'địa điểm, kinh nghiệm, dịp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5850, 70, 'ぶんや', '分野', 'lĩnh vực', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5851, 70, 'じゅよう', '需要', 'nhu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5852, 70, 'きょうきゅう', '供給', 'cung cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5853, 70, 'ぶっし', '物資', 'vật tư', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5854, 70, 'ようと', '用途', 'sử dụng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5855, 70, 'かんれん', '関連', 'liên quan, quan hệ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5856, 70, 'しょうもう', '消耗', 'tiêu thụ, tiêu hao', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5857, 70, 'けっかん', '欠陥', 'khuyết điểm, hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5858, 70, 'よび', '予備', 'dự bị, dự trữ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5859, 70, 'ふぞく', '付属', 'sự phụ thuộc, sát nhập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5860, 70, 'てあて', '手当', 'trị liệu, chuẩn bị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5861, 70, 'もと', '元', 'nguyên, ban đầu, lý do', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5862, 70, 'めん', '面', 'mặt, mặt phẳng, diện mạo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5863, 70, 'せつ', '説', 'thuyết, ý kiến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5864, 70, 'さ', '差', 'sai khác, khoảng cách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5865, 70, 'ま', '間', 'giữa, trong khoảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5866, 70, 'ぶん', '分', 'thành phần, điều kiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5867, 70, 'すじ', '筋', 'cốt truyện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5868, 70, 'よゆう', '余裕', 'thừa, dư ra, phụ cấp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5869, 70, 'ふたん', '負担', 'gánh chịu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5870, 70, 'ほしょう', '保証', 'bảo hành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5871, 70, 'さいそく', '催促', 'thúc giục, gợi nhớ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5872, 70, 'せいりつ', '成立', 'thành lập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5873, 70, 'むじゅん', '矛盾', 'mâu thuẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5874, 70, 'そんざい', '存在', 'tồn tại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5875, 70, 'あむ', '編む', 'đan', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5876, 70, 'ぬう', '縫う', 'may, khâu lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5877, 70, 'さす', '指す', 'biểu thị, chỉ vào, tham khảo, chơi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5878, 70, 'しめす', '示す', 'chỉ, bày tỏ, biểu thị', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5879, 70, 'そそぐ', '注ぐ', 'chảy vào, đổ vào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5880, 70, 'すすぐ', 'すすぐ', 'rửa, súc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5881, 70, 'さわる', '触る', 'sờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5882, 70, 'ふれる', '触れる', 'chạm, đề cập', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5883, 70, 'いだく', '抱く', 'ôm, mang, yêu mến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5884, 70, 'かかえる', '抱える', 'mang, cầm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5885, 70, 'かつぐ', '担ぐ', 'mang, vác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5886, 70, 'はがす', '剥がす', 'bóc ra, lột vỏ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5887, 70, 'えがく', '描く', 'vẽ, mô tả, tưởng tượng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5888, 70, 'くだける', '砕ける', 'bị vỡ, trơn, hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5889, 70, 'くだく', '砕く', 'phá vỡ, nghiền nát', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5890, 70, 'ふさがる', 'ふさがる', 'bị chặn, bị chiếm, khít lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5891, 70, 'ふさぐ', 'ふさぐ', 'chiếm, chặn. bị trầm cảm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5892, 70, 'さける', '避ける', 'tránh, tránh xa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5893, 70, 'よける', 'よける', 'tránh, để qua một bên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5894, 70, 'それる', 'それる', 'trượt, lỗ, lạc đề', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5895, 70, 'そらす', 'そらす', 'trốn tránh, lảng tránh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5896, 70, 'みつめる', '見つめる', 'nhìn chằm chằm, đối mặt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5897, 70, 'ながめる', '眺める', 'nhìn, trông coi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5898, 70, 'みあわせる', '見合わせる', 'nhìn nhau, bị hoãn, bị hủy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5899, 70, 'みおくる', '見送る', 'đi tiễn (khách)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5900, 71, 'おとずれる', '訪れる', 'đến, thăm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5901, 71, 'ひきかえす', '引き返す', 'quay lại', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5902, 71, 'さる', '去る', 'trải ra, đi qua, kéo dài', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5903, 71, 'すする', 'すする', 'hớp, hút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5904, 71, 'あじわる', '味わう', 'nếm, thưởng thức, trải nghiệm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5905, 71, 'におう', '匂う', 'có mùi, nực mùi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5906, 71, 'うえる', '飢える', 'đói lả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5907, 71, 'とう', '問う', 'hỏi về, yêu cầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5908, 71, 'かたる', '語る', 'nói', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5909, 71, 'ちかう', '誓う', 'thề, hứa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5910, 71, 'ささえる', '支える', 'hỗ trợ, giúp đỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5911, 71, 'ついやす', '費やす', 'tiêu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5912, 71, 'もちいる', '用いる', 'sử dụng, nhận nuôi, thuê', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5913, 71, 'あらたまる', '改まる', 'được cải tiến, được thay thế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5914, 71, 'あらためる', '改める', 'cải tiến, thay thế', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5915, 71, 'おさまる', '収まる・納まる・治まる', 'thu nạp, định cư, bình tĩnh', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5916, 71, 'おさめる', '収める・納める・治める', 'giải quyết, đạt được, giao hàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5917, 71, 'そう', '沿う・添う', 'dọc theo, men theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5918, 71, 'そえる', '添える', 'gắn với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5919, 71, 'かねる', '兼ねる', 'không thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5920, 71, 'てきする', '適する', 'hợp, xứng đáng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5921, 71, 'そうとうする', '相当する', 'tương thích', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5922, 71, 'ともなう', '伴う', 'được tham gia, kèm theo, cùng với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5923, 71, 'ひびく', '響く', 'vang, vọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5924, 71, 'つぐ', '次ぐ', 'tiếp theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5925, 71, 'りゃくす', '略す', 'lượt bớt, viết tắt, tóm gọn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5926, 71, 'せまる', '迫る', 'tiến sát, thúc giục, cưỡng bức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5927, 71, 'ねらう', '狙う', 'nhắm đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5928, 71, 'おかす', '犯す', 'thực hiện (hành vi phạm tội)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5929, 71, 'おかす', '侵す', 'xâm chiếm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5930, 71, 'おかす', '冒す', 'can đảm, đương đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5931, 71, 'おどす', '脅す', 'bắt nạt, đe dọa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5932, 71, 'おどかす', '脅かす', 'hù dọa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5933, 71, 'さからう', '逆らう', 'phản đối, không tuân theo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5934, 71, 'さまたげる', '妨げる', 'ngăn chặn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5935, 71, 'うちけす', '打ち消す', 'phủ nhận, bác bỏ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5936, 71, 'おうじる', '応じる', 'đáp lại, đối ứng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5937, 71, 'うけたまわる', '承る', 'hiểu, rõ rồi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5938, 71, 'ちょうだいする', '頂戴する', 'nhận, đồng ý, hài lòng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5939, 71, 'まなぶ', '学ぶ', 'học', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5940, 71, 'ねる', '練る', 'nhào trộn, trau chuốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5941, 71, 'おう', '負う', 'mang, vác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5942, 71, 'はたす', '果たす', 'hoàn thành', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5943, 71, 'ひきうける', '引き受ける', 'nhâận, đảm trách', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5944, 71, 'ます', '増す', 'taăng lên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5945, 71, 'かける', '欠ける', 'bỏ lỡ, thiếu sót', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5946, 71, 'かかす', '欠かす', 'thiếu, lỡ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5947, 71, 'すむ', '澄む', 'trở nên rõ ràng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5948, 71, 'にごる', '濁る', 'dính bùn, đục', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5949, 71, 'にごす', '濁す', 'nhập nhằng (nói)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5950, 71, 'しょうじる', '生じる', 'phát sinh, nguyên nhân', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5951, 71, 'およぶ', '及ぶ', 'đạt đến, lan ra, tương đương', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5952, 71, 'およぼす', '及ぼす', 'ảnh hưởng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5953, 71, 'いたる', '至る', 'dẫn đến, đi đến', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5954, 71, 'たっする', '達する', 'đến, chạm tới', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5955, 71, 'みのる', '実る', 'mang lại kết quả tốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5956, 71, 'くれる', '暮れる', 'tối, hết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5957, 71, 'おとる', '劣る', 'kém hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5958, 71, 'ことなる', '異なる', 'khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5959, 71, 'みだれる', '乱れる', 'hỗn hoạn, bị nhầm lẫn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5960, 71, 'みだす', '乱す', 'lộn xộn, làm đảo lộn kế hoạch, làm hỏng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5961, 71, 'ゆるす', '緩む', 'nới lỏng, được thư giãn, phá vớ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5962, 71, 'ゆるめる', '緩める', 'lỏng, thư giãn, hạ xuống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5963, 71, 'さびる', '錆びる', 'bị rỉ sét', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5964, 71, 'せっする', '接する', 'gắn với, tiếp xúc, gặp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5965, 71, 'ぞくする', '属する', 'thuộc về', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5966, 71, 'しめる', '占める', 'chiếm, giữ (vị trí)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5967, 71, 'くたびれる', 'くたびれる', 'bị mệt, bị chán', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5968, 71, 'めぐまれる', '恵まれる', 'được ban phước, được ưa chuộng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5969, 71, 'わく', '湧く', 'vươn ra, được làm đầy, giống', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5970, 71, 'ほほえむ', 'ほほえむ', 'cười', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5971, 71, 'ふざける', 'ふざける', 'đùa cợt, hiếu động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5972, 71, 'くやむ', '悔やむ', 'hoối tiếc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5973, 71, 'ためらう', 'ためらう', 'chần chừ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5974, 71, 'うやまう', '敬う', 'tôn trọng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5975, 72, 'さっぱり', 'さっぱり', 'hoàn toàn, sảng khoái, khéo léo, ngăn nắp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5976, 72, 'すっきり', 'すっきり', 'sảng khoái, tươi mới, minh bạch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5977, 72, '実に', '実に', 'thực sự là, thực tế, thực ra', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5978, 72, '思い切り', '思い切り', 'hết sức', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5979, 72, '何となく', '何となく', 'hơi hơi (cảm giác)', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5980, 72, 'なんだか', '何だか', 'hơi hơi, 1 chút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5981, 72, 'どうにか', 'どうにか', 'bằng cách nào đó, như thế nào đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5982, 72, 'どうにも', 'どうにも', 'chẳng thể làm gì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5983, 72, 'なんとか', '何とか', 'chút nào đó, gì đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5984, 72, 'なんとも', '何とも', 'không…một chút nào', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5985, 72, 'わざと', 'わざと', 'cố ý', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5986, 72, 'わざわざ', 'わざわざ', 'làm phiền, gây phiền', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5987, 72, 'せっかく', 'せっかく', 'đã mất công', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5988, 72, 'あいにく', 'あいにく', 'đáng tiếc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5989, 72, 'あんのじょう', '案の定', 'như mong đợi', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5990, 72, 'いよいよ', 'いよいよ', 'cuối cùng, đã đến lúc, càng ngày càng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5991, 72, 'さすが', 'さすが', 'quả là, như dự đoán, thật đúng là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5992, 72, 'とにかく', 'とにかく', 'dù sao, cách này hay cách khác', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5993, 72, 'ともかく', 'ともかく', 'dù sao, đặt (cái gì) sang một bên', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5994, 72, 'せめて', 'せめて', 'ít nhất, tối thiểu là', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5995, 72, 'せいぜい', 'せいぜい', 'tối đa, nhiều nhất có thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5996, 72, 'どうせ', 'どうせ', 'dù cho, đằng nào thì', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5997, 72, 'ぎっしり', 'ぎっしり', 'lèn chặt, đầy chặt, kín lịch', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5998, 72, 'ずらりと', 'ずらりと', 'trong một dãy', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (5999, 72, 'あっさり', 'あっさり', 'đơn giản, nhẹ nhàng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6000, 72, 'しんと・しいんと', 'しんと・しいんと', 'yên lặng, lặng lẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6001, 72, 'ちゃんと', 'ちゃんと', 'nghiêm túc, cẩn thận, tuyệt đối', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6002, 72, 'ぞくぞく', '続々', 'liên tục, cái này sau cái kia', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6003, 72, 'どっと', 'どっと', 'tất cả cùng lúc, bất thình lình, bất chợt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6004, 72, 'ばったり', 'ばったり', 'đột nhiên (ngã), đột ngột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6005, 72, 'さっさと', 'さっさと', 'nhanh chóng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6006, 72, 'さっと', 'さっと', 'nhanh, đột ngột', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6007, 72, 'すっと', 'すっと', 'vươn thẳng, (cảm thấy) tỉnh táo', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6008, 72, 'せっせと', 'せっせと', 'siêng năng, cần cù', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6009, 72, 'ざっと', 'ざっと', 'khoảng, nháp, qua', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6010, 72, 'こっそり', 'こっそり', 'bí mật, lén lút', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6011, 72, 'いきいき', '生き生き', 'sinh động', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6012, 72, 'ぼんやり', 'ぼんやり', 'lờ mờ, mơ hồ, lơ đãng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6013, 72, 'ふと', 'ふと', 'đột nhiên, tình cờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6014, 72, 'じかに', 'じかに', 'trực tiếp', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6015, 72, 'いちどに', '一度に', 'một lần, cùng lúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6016, 72, 'いっせいに', '一斉に', 'cùng lúc', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6017, 72, 'ともに', '共に', 'cùng với', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6018, 72, 'そうごに', '相互に', 'lẫn nhau, cùng nhau', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6019, 72, 'ひとりひとり', '一人一人', 'từng người một, lần lượt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6020, 72, 'いちいち', 'いちいち', 'từng thứ một, chi tiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6021, 72, 'ところどころ', '所々', 'đây đó', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6022, 72, 'どうか', 'どうか', 'làm ơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6023, 72, 'できれば・できたら', 'できれば・できたら', 'nếu có thể', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6024, 72, 'たいして', 'たいして', 'không thú vị lắm', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6025, 72, 'おそらく', '恐らく', 'có lẽ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6026, 72, 'むしろ', 'むしろ', 'hơn, tốt', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6027, 72, 'はたして', '果たして', 'quả nhiên, quả thật', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6028, 72, 'かえって', 'かえって', 'ngược lại, hơn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6029, 72, 'かならずしも', '必ずしも', 'không hẳn, không cần thiết', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6030, 72, 'たんに', '単に', 'chỉ, đơn giản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6031, 72, 'いまだに', 'いまだに', 'vẫn chưa', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6032, 72, 'ついでに', 'ついでに', 'nhân tiện', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6033, 72, 'とりあえず', 'とりあえず', 'đầu tiên, trong thơi gian này', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6034, 72, 'まんいち・まんがいち', '万一・万が一', 'khẩn cấp, trường hợp xấu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6035, 72, 'ぐうぜん', '偶然', 'ngẫu nhiên, bất ngờ', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6036, 72, 'たまたま', 'たまたま', 'tình cờ, thỉnh thoảng', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6037, 72, 'じっさい', '実際', 'thực tế, thực sự', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6038, 72, 'どうよう', '同様', 'giống như', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6039, 72, 'もともと', '元々', 'ban đầu', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6040, 72, 'ほんらい', '本来', 'từ đầu, nguyên bản', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6041, 72, 'ある', 'ある', 'có, một số', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6042, 72, 'あらゆる', 'あらゆる', 'tất cả', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6043, 72, 'たいした', 'たいした', 'quan trọng, to lớn', 'None');
    

    INSERT INTO "Vocabulary" (vocab_id, lesson_id, hiragana, word, meaning, example_sentence)
    VALUES (6044, 72, 'いわゆる', 'いわゆる', 'cái được gọi là', 'None');
    



    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20000, 51, '1', 'Nghĩa từ Việt của từ 男性 là:', 'da', 'đàn ông', 'dựng lên', 'được tích tụ', 'đàn ông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20001, 51, '1', 'Nghĩa từ Việt của từ 女性 là:', 'đóng gói', 'mọc', 'mạnh lên', 'phụ nữ', 'phụ nữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20002, 51, '1', 'Nghĩa từ Việt của từ 高齢 là:', 'rõ ràng', 'được giao đến', 'cao tuổi', 'con dấu', 'cao tuổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20003, 51, '1', 'Nghĩa từ Việt của từ 年上 là:', 'hơn tuổi', 'vỗ tay', 'cửa hàng tiện ích', 'suốt, nhiều', 'hơn tuổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20004, 51, '1', 'Nghĩa từ Việt của từ 目上 là:', 'nhãn', 'thông tin truyền thông', 'xấu bụng', 'bề trên', 'bề trên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20005, 51, '1', 'Nghĩa từ Việt của từ 先輩 là:', 'tiền bối', 'bảnh bao', 'vây quanh', 'con dấu', 'tiền bối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20006, 51, '1', 'Nghĩa từ Việt của từ 後輩 là:', 'hậu bối', 'nỗ lực', 'phép cộng, tác động tích cực', 'chính xác', 'hậu bối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20007, 51, '1', 'Nghĩa từ Việt của từ 上司 là:', 'cấp trên', 'kiểu, thói', 'văn hóa', 'giết', 'cấp trên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20008, 51, '1', 'Nghĩa từ Việt của từ 相手 là:', 'tổ chức', 'nướng, nấu', 'người đối diện', 'thế thì', 'người đối diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20009, 51, '1', 'Nghĩa từ Việt của từ 知り合い là:', 'người quen', 'chỉnh sửa', 'giao đến', 'mất điện', 'người quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20010, 51, '1', 'Nghĩa từ Việt của từ 友人 là:', 'đạt được, có được', 'ngại ngần', 'bạn bè', 'cao nhất', 'bạn bè');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20011, 51, '1', 'Nghĩa từ Việt của từ 仲 là:', 'đặc biệt', 'bị đánh', 'thấp nhất', 'mối quan hệ', 'mối quan hệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20012, 51, '1', 'Nghĩa từ Việt của từ 生年月日 là:', 'ngày tháng năm sinh', 'nổi tiếng', 'nói chuyện riêng', 'mặt trời', 'ngày tháng năm sinh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20013, 51, '1', 'Nghĩa từ Việt của từ 誕生 là:', 'lỗi', 'đường tắt', 'giao đến', 'ra đời', 'ra đời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20014, 51, '1', 'Nghĩa từ Việt của từ 年 là:', 'giao vào, lẫn vào', 'năm', 'dọn dẹp', 'phép cộng, tác động tích cực', 'năm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20015, 51, '1', 'Nghĩa từ Việt của từ 出身 là:', 'băn khoăn', 'bị nguội', 'so sánh', 'quê quán', 'quê quán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20016, 51, '1', 'Nghĩa từ Việt của từ 故郷 là:', 'cố hương', 'kết quả', 'người được nói đến', 'đông đúc', 'cố hương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20017, 51, '1', 'Nghĩa từ Việt của từ 成長 là:', 'trưởng thành', 'bất mãn', 'bị nguội', 'lỗ', 'trưởng thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20018, 51, '1', 'Nghĩa từ Việt của từ 成人 là:', 'phép trừ, tác động tiêu cực', 'quê quán', 'hớn hở', 'người trưởng thành', 'người trưởng thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20019, 51, '1', 'Nghĩa từ Việt của từ 合格 là:', 'đỗ đại học', 'tội phạm', 'bị thừa', 'đăng ký', 'đỗ đại học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20020, 51, '1', 'Nghĩa từ Việt của từ 進学 là:', 'kết thúc', 'vào đại học', 'giá cả, vật giá', 'phát triển', 'vào đại học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20021, 51, '1', 'Nghĩa từ Việt của từ 退学 là:', 'làm khô', 'bỏ học', 'dựng lên', 'lo lắng', 'bỏ học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20022, 51, '1', 'Nghĩa từ Việt của từ 就職 là:', 'có việc làm', 'tài nguyên', 'mời, rủ', 'cấm', 'có việc làm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20023, 51, '1', 'Nghĩa từ Việt của từ 退職 là:', 'nghỉ việc', 'trạng thái', 'đi làm, học', 'chịu đựng giỏi', 'nghỉ việc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20024, 51, '1', 'Nghĩa từ Việt của từ 失業 là:', 'bị ướt', 'thất nghiệp', 'hòa bình', 'yên tâm', 'thất nghiệp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20025, 51, '1', 'Nghĩa từ Việt của từ 残業 là:', 'thông dịch', 'làm thêm', 'mất', 'thông dịch', 'làm thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20026, 51, '1', 'Nghĩa từ Việt của từ 生活 là:', 'cuộc sống', 'lại gần', 'rán ngập', 'trung bình', 'cuộc sống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20027, 51, '1', 'Nghĩa từ Việt của từ 通勤 là:', 'kịp giờ', 'lật lên', 'đi làm', 'thiết kế', 'đi làm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20028, 51, '1', 'Nghĩa từ Việt của từ 学歴 là:', 'giảm xuống', 'bằng cấp', 'thuê', 'suốt đời', 'bằng cấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20029, 51, '1', 'Nghĩa từ Việt của từ 給料 là:', 'bị giảm', 'tiền lương', 'yêu', 'về nhà', 'tiền lương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20030, 51, '1', 'Nghĩa từ Việt của từ 面接 là:', 'phỏng vấn', 'xuất hiện, hiện ra', 'thay đổi', 'quan tâm, thông cảm', 'phỏng vấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20031, 51, '1', 'Nghĩa từ Việt của từ 休憩 là:', 'nghỉ ngơi', 'cố hương', 'thiếu', 'hớn hở', 'nghỉ ngơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20032, 51, '1', 'Nghĩa từ Việt của từ 観光 là:', 'tham quan', 'thông qua, được chấp nhận, đi qua', 'thông tin', 'quấn, quàng', 'tham quan');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20033, 51, '1', 'Nghĩa từ Việt của từ 帰国 là:', 'về nước', 'làm bẩn', 'trở về, trả lại', 'đoàn thể', 'về nước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20034, 51, '1', 'Nghĩa từ Việt của từ 帰省 là:', 'bị ướt', 'về quê', 'loại', 'tăng giá', 'về quê');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20035, 51, '1', 'Nghĩa từ Việt của từ 帰宅 là:', 'tổ chức', 'tiến bộ', 'đánh thức', 'về nhà', 'về nhà');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20036, 51, '1', 'Nghĩa từ Việt của từ 参加 là:', 'ăn liền', 'xé rách', 'tham gia', 'giới thiệu, gợi ý', 'tham gia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20037, 51, '1', 'Nghĩa từ Việt của từ 出席 là:', 'ghê, siêu', 'có mặt', 'bọc', 'ghê, siêu', 'có mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20038, 51, '1', 'Nghĩa từ Việt của từ 欠席 là:', 'rất', 'tai nạn', 'tình nguyện', 'vắng mặt', 'vắng mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20039, 51, '1', 'Nghĩa từ Việt của từ 遅刻 là:', 'kiên nhẫn, chăm chú, chằm chằm', 'so sánh', 'thiết kế', 'đến muộn', 'đến muộn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20040, 51, '1', 'Nghĩa từ Việt của từ 化粧 là:', 'tươi', 'sản phẩm', 'dự phòng', 'trang điểm', 'trang điểm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20041, 51, '1', 'Nghĩa từ Việt của từ 計算 là:', 'top', 'tính toán', 'thiết kế', 'tăng lên', 'tính toán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20042, 51, '1', 'Nghĩa từ Việt của từ 計画 là:', 'suốt đời', 'hiểu nhầm', 'kế hoạch', 'cuối cùng', 'kế hoạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20043, 51, '1', 'Nghĩa từ Việt của từ 成功 là:', 'thành công', 'tai nạn', 'thịnh vượng', 'tóm, chộp', 'thành công');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20044, 51, '1', 'Nghĩa từ Việt của từ 失敗 là:', 'trình độ, level', 'sản phẩm', 'thất bại', 'cố hương', 'thất bại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20045, 51, '1', 'Nghĩa từ Việt của từ 準備 là:', 'thực tế là', 'chuẩn bị', 'bị tràn', 'hớn hở', 'chuẩn bị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20046, 51, '1', 'Nghĩa từ Việt của từ 整理 là:', 'bề trên', 'về nước', 'người trưởng thành', 'chỉnh sửa', 'chỉnh sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20047, 51, '1', 'Nghĩa từ Việt của từ 注文 là:', 'mọc', 'cho bay', 'đặt hàng', 'xé rách', 'đặt hàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20048, 51, '1', 'Nghĩa từ Việt của từ 貯金 là:', 'cao nhất', 'cháy', 'tiết kiệm', 'hiểu nhầm', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20049, 51, '1', 'Nghĩa từ Việt của từ 徹夜 là:', 'thông báo', 'thức xuyên đêm', 'loại', 'trình độ, level', 'thức xuyên đêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20050, 51, '1', 'Nghĩa từ Việt của từ 引っ越し là:', 'tắc đường', 'vào đại học', 'chuyển nhà', 'nỗ lực', 'chuyển nhà');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20051, 51, '1', 'Nghĩa từ Việt của từ 身長 là:', 'tránh xa', 'shock, choáng', 'cấp trên', 'chiều cao', 'chiều cao');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20052, 51, '1', 'Nghĩa từ Việt của từ 体重 là:', 'cân nặng', 'phát kiến', 'tình nguyện', 'thói quen', 'cân nặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20053, 51, '1', 'Nghĩa từ Việt của từ けが là:', 'đoàn thể', 'khởi đầu', 'mất', 'vết thương', 'vết thương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20054, 51, '1', 'Nghĩa từ Việt của từ 会 là:', 'hội, tiệc', 'da', 'nắm chặt', 'con dấu', 'hội, tiệc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20055, 51, '1', 'Nghĩa từ Việt của từ 趣味 là:', 'bị gãy', 'giao đến', 'sở thích', 'kết quả', 'sở thích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20056, 51, '1', 'Nghĩa từ Việt của từ 興味 là:', 'suốt đời', 'hứng thú', 'nhãn hiệu', 'làm tăng lên', 'hứng thú');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20057, 51, '1', 'Nghĩa từ Việt của từ 思い出 là:', 'nhớ lại', 'chán', 'bị giảm', 'yên tâm', 'nhớ lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20058, 51, '1', 'Nghĩa từ Việt của từ 冗談 là:', 'kịp giờ', 'bị gãy', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đùa cợt', 'đùa cợt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20059, 51, '1', 'Nghĩa từ Việt của từ 目的 là:', 'gửi', 'giống', 'mục đích', 'kết thúc', 'mục đích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20060, 51, '1', 'Nghĩa từ Việt của từ 約束 là:', 'tươi', 'lời hứa', 'mạnh, giỏi', 'dựng lên', 'lời hứa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20061, 51, '1', 'Nghĩa từ Việt của từ おしゃべり là:', 'vỗ tay', 'nói chuyện riêng', 'hớn hở', 'đăng ký, ứng tuyển', 'nói chuyện riêng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20062, 51, '1', 'Nghĩa từ Việt của từ 遠慮 là:', 'ngại ngần', 'tôn giáo', 'hớn hở', 'nhiều', 'ngại ngần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20063, 51, '1', 'Nghĩa từ Việt của từ 我慢 là:', 'nội dung', 'cháy', 'chịu đựng', 'cao nhất', 'chịu đựng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20064, 51, '1', 'Nghĩa từ Việt của từ 目枠 là:', 'sạch', 'quan tâm, thông cảm', 'làm phiền', 'kiểu, thói', 'làm phiền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20065, 51, '1', 'Nghĩa từ Việt của từ 希望 là:', 'phép cộng, tác động tích cực', 'hi vọng', 'thuê', 'mời, rủ', 'hi vọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20066, 51, '1', 'Nghĩa từ Việt của từ 夢 là:', 'giấc mơ', 'bầu cử', 'làm vỡ', 'giải quyết', 'giấc mơ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20067, 51, '1', 'Nghĩa từ Việt của từ 賛成 là:', 'đàn ông', 'hòa bình', 'thay đổi', 'đồng ý', 'đồng ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20068, 51, '1', 'Nghĩa từ Việt của từ 反対 là:', 'tin tức, thông báo', 'thần bí', 'trạng thái', 'đối lập', 'đối lập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20069, 51, '1', 'Nghĩa từ Việt của từ 創造 là:', 'tưởng tượng', 'tiến lên', 'được tiết kiệm', 'làm thay đổi', 'tưởng tượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20070, 51, '1', 'Nghĩa từ Việt của từ 努力 là:', 'giống', 'nỗ lực', 'giá cả, vật giá', 'lặp lại', 'nỗ lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20071, 51, '1', 'Nghĩa từ Việt của từ 太陽 là:', 'làm tăng lên', 'làm giảm xuống', 'hơn nữa', 'mặt trời', 'mặt trời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20072, 51, '1', 'Nghĩa từ Việt của từ 地球 là:', 'sống', 'đâm', 'da', 'trái đất', 'trái đất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20073, 51, '1', 'Nghĩa từ Việt của từ 温度 là:', 'nhiệt độ', 'phát kiến', 'thông tin', 'suốt đời', 'nhiệt độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20074, 51, '1', 'Nghĩa từ Việt của từ 湿度 là:', 'hỏng', 'độ ẩm', 'tham quan', 'mang đến gần', 'độ ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20075, 51, '1', 'Nghĩa từ Việt của từ 湿気 là:', 'được giao đến', 'hơi ẩm', 'kế hoạch', 'yên tâm', 'hơi ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20076, 51, '1', 'Nghĩa từ Việt của từ 梅雨 là:', 'làm phiền', 'đùa cợt', 'mùa mưa', 'cảm thấy', 'mùa mưa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20077, 51, '1', 'Nghĩa từ Việt của từ かび là:', 'được giao đến', 'lãnh đạo', 'nấm mốc', 'xấu bụng', 'nấm mốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20078, 51, '1', 'Nghĩa từ Việt của từ 暖房 là:', 'cấm', 'ngạc nhiên', 'được quyết định', 'điều hòa ấm', 'điều hòa ấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20079, 51, '1', 'Nghĩa từ Việt của từ 皮 là:', 'da', 'lo lắng', 'trầm lặng', 'ngủ', 'da');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20080, 51, '1', 'Nghĩa từ Việt của từ 館 là:', 'tắc đường', 'can', 'tiết kiệm', 'tiêu dùng, tiêu thụ', 'can');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20081, 51, '1', 'Nghĩa từ Việt của từ 画面 là:', 'thông tin', 'nhất định', 'nghệ thuật', 'màn hình', 'màn hình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20082, 51, '1', 'Nghĩa từ Việt của từ 番組 là:', 'được sử dụng', 'trạng thái', 'suy nghĩ, cảm giác', 'chương trình', 'chương trình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20083, 51, '1', 'Nghĩa từ Việt của từ 記事 là:', 'đủ', 'giao đến', 'ký sự', 'tuyên truyền', 'ký sự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20084, 51, '1', 'Nghĩa từ Việt của từ 近所 là:', 'đăng ký', 'mũ bảo hiểm', 'có thể, được xây dựng', 'xung quanh', 'xung quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20085, 51, '1', 'Nghĩa từ Việt của từ 警察 là:', 'vượt qua', 'cảnh sát', 'lo lắng', 'tráng miệng', 'cảnh sát');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20086, 51, '1', 'Nghĩa từ Việt của từ 犯人 là:', 'giao tiếp', 'tội phạm', 'làm cho tiến lên', 'vỗ tay', 'tội phạm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20087, 51, '1', 'Nghĩa từ Việt của từ 小銭 là:', 'mối quan hệ', 'tiền lẻ', 'biểu thị, biểu lộ, đại diện', 'phương đông', 'tiền lẻ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20088, 51, '1', 'Nghĩa từ Việt của từ ごちそう là:', 'nổi tiếng', 'vô lý', 'bị sai', 'chiêu đãi', 'chiêu đãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20089, 51, '1', 'Nghĩa từ Việt của từ 作者 là:', 'tràn', 'tai nạn', 'tác giả', 'thay đổi', 'tác giả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20090, 51, '1', 'Nghĩa từ Việt của từ 作品 là:', 'thông tin truyền thông', 'tác phẩm', 'xuyên qua, thông qua', 'tiết kiệm', 'tác phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20091, 51, '1', 'Nghĩa từ Việt của từ 制服 là:', 'hiểu nhầm', 'lòe loẹt', 'cơ bản', 'đồng phục', 'đồng phục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20092, 51, '1', 'Nghĩa từ Việt của từ 洗剤 là:', 'kiên quyết, chắc chắn, đáng tin cậy', 'bỏ học', 'sống', 'bột giặt', 'bột giặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20093, 51, '1', 'Nghĩa từ Việt của từ 底 là:', 'kịp giờ', 'người đối diện', 'bay', 'đáy', 'đáy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20094, 51, '1', 'Nghĩa từ Việt của từ 地下 là:', 'kiểu gì cũng', 'giống', 'ngầm', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'ngầm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20095, 51, '1', 'Nghĩa từ Việt của từ 寺 là:', 'xuất hiện, được thẻ hiện', 'hậu bối', 'thiếu', 'chùa', 'chùa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20096, 51, '1', 'Nghĩa từ Việt của từ 道路 là:', 'rõ ràng', 'đặc biệt', 'đường', 'trạng thái', 'đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20097, 51, '1', 'Nghĩa từ Việt của từ 坂 là:', 'tiền bối', 'dốc', 'đổ', 'lòe loẹt', 'dốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20098, 51, '1', 'Nghĩa từ Việt của từ 煙 là:', 'tin tức, thông báo', 'khói', 'hết', 'tiết kiệm', 'khói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20099, 51, '1', 'Nghĩa từ Việt của từ 灰 là:', '(không) tí gì', 'tàn', 'bất an', 'hoạt động', 'tàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20100, 51, '1', 'Nghĩa từ Việt của từ 判 là:', 'con dấu', 'bắt', 'đường tắt', 'bị gãy', 'con dấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20101, 51, '1', 'Nghĩa từ Việt của từ 名刺 là:', 'danh thiếp', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'không bao giờ', 'tráng miệng', 'danh thiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20102, 51, '1', 'Nghĩa từ Việt của từ 免許 là:', 'giấy phép', 'cao lên', 'trung bình', 'trở nên ấm hơn', 'giấy phép');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20103, 51, '1', 'Nghĩa từ Việt của từ 多く là:', 'thế nào, bao nhiêu', 'loáng một cái', 'thuê', 'nhiều', 'nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20104, 51, '1', 'Nghĩa từ Việt của từ 前半 là:', 'mang đến gần', 'quốc tịch', 'phần đầu', 'vô lý', 'phần đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20105, 51, '1', 'Nghĩa từ Việt của từ 後半 là:', 'thói quen', 'phần cuối', 'tiền bối', 'che giấu', 'phần cuối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20106, 51, '1', 'Nghĩa từ Việt của từ 最高 là:', 'cao nhất', 'rất', 'nổi tiếng', 'bên trong', 'cao nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20107, 51, '1', 'Nghĩa từ Việt của từ 最低 là:', 'nhãn', 'làm khô', 'thấp nhất', 'kiên nhẫn, chăm chú, chằm chằm', 'thấp nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20108, 51, '1', 'Nghĩa từ Việt của từ 最初 là:', 'hiểu, thông qua', 'giảm xuống', 'đầu tiên', 'làm bẩn', 'đầu tiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20109, 51, '1', 'Nghĩa từ Việt của từ 最後 là:', 'cuối cùng', 'hớn hở', 'được sử dụng', 'gặp', 'cuối cùng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20110, 51, '1', 'Nghĩa từ Việt của từ 自動 là:', 'tự động', 'đùa cợt', 'thiết kế', 'vừa vặn, đúng', 'tự động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20111, 51, '1', 'Nghĩa từ Việt của từ 種類 là:', 'loại', 'xung quanh', 'ẩn náu, trốn', 'ẩn náu, trốn', 'loại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20112, 51, '1', 'Nghĩa từ Việt của từ 性格 là:', 'nhiều', 'bị thừa', 'tươi', 'tính cách', 'tính cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20113, 51, '1', 'Nghĩa từ Việt của từ 性質 là:', 'thiếu', 'tính chất', 'xung quanh, vòng quanh', 'dũng cảm, dũng khí', 'tính chất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20114, 51, '1', 'Nghĩa từ Việt của từ 順番 là:', 'thứ tự', 'truyền đi, giới thiệu', 'tăng giá', 'về quê', 'thứ tự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20115, 51, '1', 'Nghĩa từ Việt của từ 番 là:', 'thói quen', 'lượt', 'trưởng thành', 'trái đất', 'lượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20116, 51, '1', 'Nghĩa từ Việt của từ 方法 là:', 'không bao giờ', 'phương pháp', 'xấu bụng', 'tiền bối', 'phương pháp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20117, 51, '1', 'Nghĩa từ Việt của từ 製品 là:', 'cầu, khấn', 'đóng gói', 'sản phẩm', 'hiện tại', 'sản phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20118, 51, '1', 'Nghĩa từ Việt của từ 値上がり là:', 'tăng giá', 'lễ nghĩa', 'ngại ngần', 'chiêu đãi', 'tăng giá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20119, 51, '1', 'Nghĩa từ Việt của từ 生 là:', 'tách ra', 'xấu bụng', 'sự kiện', 'tươi', 'tươi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20120, 52, '1', 'Nghĩa từ Việt của từ 渇く là:', 'hối hận', 'có lẽ', 'khát', 'dđóng', 'khát');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20121, 52, '1', 'Nghĩa từ Việt của từ 嗅ぐ là:', 'ngửi', 'trung bình', 'kết quả', 'đạt được, có được', 'ngửi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20122, 52, '1', 'Nghĩa từ Việt của từ 叩く là:', 'giao tiếp', 'đánh, vỗ', 'tiền bối', 'giá cả, vật giá', 'đánh, vỗ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20123, 52, '1', 'Nghĩa từ Việt của từ 殴る là:', 'cầu, khấn', 'kiểu, thói', 'bên trong', 'đấm', 'đấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20124, 52, '1', 'Nghĩa từ Việt của từ ける là:', 'yêu cầu', 'hiểu nhầm', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'đá', 'đá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20125, 52, '1', 'Nghĩa từ Việt của từ 抱く là:', 'hiểu, thông qua', 'nổi tiếng', 'gián đoạn', 'ôm', 'ôm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20126, 52, '1', 'Nghĩa từ Việt của từ 倒れる là:', 'đổ', 'rõ ràng', 'hồi phục', 'vừa, được công bố', 'đổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20127, 52, '1', 'Nghĩa từ Việt của từ 倒す là:', 'làm đổ', 'thuê', 'bắt tay', 'quen', 'làm đổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20128, 52, '1', 'Nghĩa từ Việt của từ 起きる là:', 'đại thể, thường', 'thức dậy', 'kiểu, thói', 'đánh thức', 'thức dậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20129, 52, '1', 'Nghĩa từ Việt của từ 起こす là:', 'đánh thức', 'được bao phủ', 'về quê', 'nổi tiếng', 'đánh thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20130, 52, '1', 'Nghĩa từ Việt của từ 尋ねる là:', 'tiến lên', 'tóm, chộp', 'đổ', 'hỏi', 'hỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20131, 52, '1', 'Nghĩa từ Việt của từ 呼ぶ là:', 'gọi', 'tắc đường', 'yếu đi', 'chỉnh sửa', 'gọi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20132, 52, '1', 'Nghĩa từ Việt của từ 叫ぶ là:', 'bị ướt', 'gào to', 'không bao giờ', 'đông đúc', 'gào to');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20133, 52, '1', 'Nghĩa từ Việt của từ 黙る là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'im lặng', 'thực hành', 'tôn giáo', 'im lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20134, 52, '1', 'Nghĩa từ Việt của từ 飼う là:', 'nổi tiếng', 'nuôi', 'kết thúc', 'cố hương', 'nuôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20135, 52, '1', 'Nghĩa từ Việt của từ 数える là:', 'đếm', 'tiêu dùng, tiêu thụ', 'cháy', 'sản phẩm', 'đếm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20136, 52, '1', 'Nghĩa từ Việt của từ 乾く là:', 'lo lắng', 'khô', 'đăng ký', 'phương đông', 'khô');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20137, 52, '1', 'Nghĩa từ Việt của từ 乾かす là:', 'được chia ra', 'làm khô', 'thói quen', 'bị thừa', 'làm khô');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20138, 52, '1', 'Nghĩa từ Việt của từ 畳む là:', 'giữ', 'mang đến gần', 'gấp', 'gọi', 'gấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20139, 52, '1', 'Nghĩa từ Việt của từ 誘う là:', 'mời, rủ', 'cấm', 'xấu bụng', 'nhóm', 'mời, rủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20140, 52, '1', 'Nghĩa từ Việt của từ おごる là:', 'chiêu đãi', 'làm yếu đi', 'bảo vệ', 'loại', 'chiêu đãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20141, 52, '1', 'Nghĩa từ Việt của từ 預かる là:', 'trưởng thành', 'cần thiết', 'hậu bối', 'chăm sóc', 'chăm sóc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20142, 52, '1', 'Nghĩa từ Việt của từ 預ける là:', 'điều hòa ấm', 'mất', 'sôi', 'gửi', 'gửi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20143, 52, '1', 'Nghĩa từ Việt của từ 決まる là:', 'có hiệu quả', 'được quyết định', 'có lẽ', 'chủ yếu, khá', 'được quyết định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20144, 52, '1', 'Nghĩa từ Việt của từ 決める là:', 'bỏ học', 'quyết định', 'không bao giờ', 'hiểu, thông qua', 'quyết định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20145, 52, '1', 'Nghĩa từ Việt của từ 写る là:', 'luật lệ', 'vừa, được công bố', 'chụp được', 'tiết kiệm', 'chụp được');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20146, 52, '1', 'Nghĩa từ Việt của từ 写す là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chụp', 'danh thiếp', 'không bao giờ', 'chụp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20147, 52, '1', 'Nghĩa từ Việt của từ 思い出す là:', 'vượt, lướt', 'nhớ lại', 'vô lý', 'lừa', 'nhớ lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20148, 52, '1', 'Nghĩa từ Việt của từ 教わる là:', 'loại', 'được dạy', 'nhớ lại', 'hiểu, thông qua', 'được dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20149, 52, '1', 'Nghĩa từ Việt của từ 申し込む là:', 'ngủ', 'tai nạn', 'lừa', 'đăng ký', 'đăng ký');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20150, 52, '1', 'Nghĩa từ Việt của từ 断る là:', 'thế thì', 'từ chối', 'quan hệ', 'được bao phủ', 'từ chối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20151, 52, '1', 'Nghĩa từ Việt của từ 見つかる là:', 'rõ ràng', 'ngạc nhiên', 'tránh xa', 'được tìm thấy', 'được tìm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20152, 52, '1', 'Nghĩa từ Việt của từ 見つける là:', 'tìm thấy', 'cửa hàng tiện ích', 'làm tăng lên', 'ngoại lệ', 'tìm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20153, 52, '1', 'Nghĩa từ Việt của từ 捕まる là:', 'sung sướng', 'bị bắt', 'loại', 'nướng, nấu', 'bị bắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20154, 52, '1', 'Nghĩa từ Việt của từ 捕まえる là:', 'kiểu gì cũng', 'bắt', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đề xuất', 'bắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20155, 52, '1', 'Nghĩa từ Việt của từ 乗る là:', 'nhất định', 'nhảy', 'cảm thấy', 'leo lên', 'leo lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20156, 52, '1', 'Nghĩa từ Việt của từ 乗せる là:', 'vừa, được công bố', 'yêu cầu', 'cho lên', 'quốc tịch', 'cho lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20157, 52, '1', 'Nghĩa từ Việt của từ 降りる là:', 'kinh doanh, buôn bán', 'xuống', 'phương đông', 'mạnh lên', 'xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20158, 52, '1', 'Nghĩa từ Việt của từ 降ろす là:', 'cho xuống', 'khát', 'đồng phục', 'phát minh', 'cho xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20159, 52, '1', 'Nghĩa từ Việt của từ 直る là:', 'đăng ký, ứng tuyển', 'da', 'được sửa', 'bao gồm', 'được sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20160, 52, '1', 'Nghĩa từ Việt của từ 直す là:', 'tốt, đủ', 'sửa', 'top', 'gián đoạn', 'sửa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20161, 52, '1', 'Nghĩa từ Việt của từ 治る là:', 'top', 'suy nghĩ, cảm giác', 'hồi phục', 'quê quán', 'hồi phục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20162, 52, '1', 'Nghĩa từ Việt của từ 治す là:', 'microphone, ghi âm', 'cứu chữa', 'giá cả, vật giá', 'bầu cử', 'cứu chữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20163, 52, '1', 'Nghĩa từ Việt của từ 亡くなる là:', 'hàng', 'sôi', 'chết', 'giá cả, vật giá', 'chết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20164, 52, '1', 'Nghĩa từ Việt của từ 亡くす là:', 'tự tin', 'giảm', 'thế nào, bao nhiêu', 'mất', 'mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20165, 52, '1', 'Nghĩa từ Việt của từ 生まれる là:', 'tuyên truyền', 'trình độ, level', 'toàn bộ', 'được sinh ra', 'được sinh ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20166, 52, '1', 'Nghĩa từ Việt của từ 生む là:', 'sinh', 'được nấu, được nướng', 'so sánh', 'làm khô', 'sinh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20167, 52, '1', 'Nghĩa từ Việt của từ 出会う là:', 'gặp (ngẫu nhiên)', 'được xây', 'tôn giáo', 'thịnh vượng', 'gặp (ngẫu nhiên)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20168, 52, '1', 'Nghĩa từ Việt của từ 訪ねる là:', 'bỏ học', 'thăm', 'ngủ', 'thói quen', 'thăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20169, 52, '1', 'Nghĩa từ Việt của từ 付き合う là:', 'mọc', 'cảm động', 'hẹn hò, giao tiếp', 'tự động', 'hẹn hò, giao tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20170, 52, '1', 'Nghĩa từ Việt của từ 効く là:', 'tốt lên', 'vỗ tay', 'thông tin', 'có hiệu quả', 'có hiệu quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20171, 52, '1', 'Nghĩa từ Việt của từ はやる là:', 'phổ biến', 'sạch', 'bắt', 'quê quán', 'phổ biến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20172, 52, '1', 'Nghĩa từ Việt của từ 経つ là:', 'qua', 'làm vỡ', 'bất an', 'chủ đề', 'qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20173, 52, '1', 'Nghĩa từ Việt của từ 間に合う là:', 'đàn ông', 'cay cú', 'phỏng vấn', 'làm cho kịp giờ', 'làm cho kịp giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20174, 52, '1', 'Nghĩa từ Việt của từ 間に合わせる là:', 'bảo vệ', 'khẩn cấp, vội', 'kịp giờ', 'nghỉ việc', 'kịp giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20175, 52, '1', 'Nghĩa từ Việt của từ 通う là:', 'cho vào, cho lên, công bố', 'bị chôn', 'đi làm, học', 'trình độ, level', 'đi làm, học');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20176, 52, '1', 'Nghĩa từ Việt của từ 込む là:', 'đông', 'bị giảm', 'bị thừa', 'nuôi(râu)', 'đông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20177, 52, '1', 'Nghĩa từ Việt của từ すれ違う là:', 'tai nạn', 'giàu có', 'truyền đi, giới thiệu', 'vượt, lướt', 'vượt, lướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20178, 52, '1', 'Nghĩa từ Việt của từ 掛かる là:', 'thiết kế', 'được bao phủ', 'đường tắt', 'nhóm', 'được bao phủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20179, 52, '1', 'Nghĩa từ Việt của từ 掛ける là:', 'bao phủ', 'hơi ẩm', 'đàn ông', 'nhãn', 'bao phủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20180, 52, '1', 'Nghĩa từ Việt của từ 動く là:', 'văn hóa', 'đủ', 'hoạt động', 'đầy', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20181, 52, '1', 'Nghĩa từ Việt của từ 動かす là:', 'di chuyển', 'thiệt hại', 'say', 'giới thiệu, gợi ý', 'di chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20182, 52, '1', 'Nghĩa từ Việt của từ 離れる là:', 'dựng lên', 'tăng giá', 'tuyên truyền', 'tránh xa', 'tránh xa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20183, 52, '1', 'Nghĩa từ Việt của từ 離す là:', 'quấn, quàng', 'da', 'đại thể, thường', 'tách ra', 'tách ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20184, 52, '1', 'Nghĩa từ Việt của từ ぶつかる là:', 'thực hành', 'bị đâm', 'ghê, siêu', 'nữa', 'bị đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20185, 52, '1', 'Nghĩa từ Việt của từ ぶつける là:', 'cửa hàng tiện ích', 'tiết kiệm', 'đâm', 'sự kiện', 'đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20186, 52, '1', 'Nghĩa từ Việt của từ こぼれる là:', 'mượn', 'vào đại học', 'bị tràn', 'tăng giá', 'bị tràn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20187, 52, '1', 'Nghĩa từ Việt của từ こぼす là:', 'tràn', 'ngại ngần', 'hoàn thành', 'quen', 'tràn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20188, 52, '1', 'Nghĩa từ Việt của từ ふく là:', 'về nhà', 'lau', 'khẩn cấp, vội', 'thịnh vượng', 'lau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20189, 52, '1', 'Nghĩa từ Việt của từ 片付く là:', 'truyền đi, giới thiệu', 'tránh xa', 'nuôi(râu)', 'được dọn dẹp', 'được dọn dẹp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20190, 52, '1', 'Nghĩa từ Việt của từ 片付ける là:', 'cho xuống', 'truyền đi, giới thiệu', 'dọn dẹp', 'kiên nhẫn, chăm chú, chằm chằm', 'dọn dẹp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20191, 52, '1', 'Nghĩa từ Việt của từ 包む là:', 'nghỉ việc', 'lần lượt, tương ứng', 'bọc', 'bị đâm', 'bọc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20192, 52, '1', 'Nghĩa từ Việt của từ 張る là:', 'dán', 'giàu có', 'thiệt hại', 'che giấu', 'dán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20193, 52, '1', 'Nghĩa từ Việt của từ 無くなる là:', 'bị đâm', 'bị mất', 'giúp đỡ', 'nghỉ việc', 'bị mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20194, 52, '1', 'Nghĩa từ Việt của từ 無くす là:', 'nhãn', 'quê quán', 'sau cùng, cuối cùng, sau tất cả', 'mất', 'mất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20195, 52, '1', 'Nghĩa từ Việt của từ 足りる là:', 'được trả lại', 'về nhà', 'đủ', 'làm giảm xuống', 'đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20196, 52, '1', 'Nghĩa từ Việt của từ 残る là:', 'dũng cảm, dũng khí', 'bị thừa', 'nổi tiếng', 'giúp đỡ', 'bị thừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20197, 52, '1', 'Nghĩa từ Việt của từ 残す là:', 'thừa', 'cao lên', 'tình nguyện', 'đùa cợt', 'thừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20198, 52, '1', 'Nghĩa từ Việt của từ 腐る là:', 'đại thể, thường', 'tính chất', 'tự tin', 'thối', 'thối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20199, 52, '1', 'Nghĩa từ Việt của từ むける là:', 'bị lột', 'tờ rơi', 'bầu cử', 'tự tin', 'bị lột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20200, 52, '1', 'Nghĩa từ Việt của từ むく là:', 'vết thương', 'tự kiểm tra', 'lột', 'nỗ lực', 'lột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20201, 52, '1', 'Nghĩa từ Việt của từ 滑る là:', 'trượt', 'mở rộng, bùng phát, lan tràn, trải dài', 'thực hành', 'sự kiện', 'trượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20202, 52, '1', 'Nghĩa từ Việt của từ 積もる là:', 'được tích tụ', 'đông đúc', 'điều tra', 'tin đồn', 'được tích tụ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20203, 52, '1', 'Nghĩa từ Việt của từ 積む là:', 'bầu cử', 'bị trì hoãn, bị kéo dài', 'luật lệ', 'tích tụ, chất lại', 'tích tụ, chất lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20204, 52, '1', 'Nghĩa từ Việt của từ 空く là:', 'nhảy', 'ngơ ngác, không để ý', 'bị thủng', 'được giao đến', 'bị thủng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20205, 52, '1', 'Nghĩa từ Việt của từ 空ける là:', 'thủng', 'được tìm thấy', 'gào to', 'giao vào, lẫn vào', 'thủng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20206, 52, '1', 'Nghĩa từ Việt của từ 下がる là:', 'cầu, khấn', 'bị giảm', 'nhất định', 'giao vào, lẫn vào', 'bị giảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20207, 52, '1', 'Nghĩa từ Việt của từ 下げる là:', 'đối lập', 'giảm', 'chỉnh sửa', 'làm thêm', 'giảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20208, 52, '1', 'Nghĩa từ Việt của từ 冷える là:', 'bị lạnh', 'nhớ lại', 'nội dung', 'tiết kiệm', 'bị lạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20209, 52, '1', 'Nghĩa từ Việt của từ 冷やす là:', 'làm lạnh', 'lo lắng', 'trình độ, level', 'thăm', 'làm lạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20210, 52, '1', 'Nghĩa từ Việt của từ 冷める là:', 'cho mượn', 'bị nguội', 'rủ, mời, gợi ý', 'hòa bình', 'bị nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20211, 52, '1', 'Nghĩa từ Việt của từ 冷ます là:', 'thành phố', 'điều hòa ấm', 'làm nguội', 'giá cả, vật giá', 'làm nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20212, 52, '1', 'Nghĩa từ Việt của từ 燃える là:', 'cháy', 'hạnh phúc', 'danh thiếp', 'điều hòa ấm', 'cháy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20213, 52, '1', 'Nghĩa từ Việt của từ 燃やす là:', 'tính chất', 'đốt', 'biểu hiện (trên mặt)', 'trưởng thành', 'đốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20214, 52, '1', 'Nghĩa từ Việt của từ 沸く là:', 'bị chôn', 'sôi', 'thoải mái', 'khởi đầu', 'sôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20215, 52, '1', 'Nghĩa từ Việt của từ 沸かす là:', 'danh thiếp', 'thế kỷ', 'đun sôi', 'tóm, chộp', 'đun sôi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20216, 52, '1', 'Nghĩa từ Việt của từ 鳴る là:', 'thành công', 'kêu', 'hiểu, thông qua', 'tiền bối', 'kêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20217, 52, '1', 'Nghĩa từ Việt của từ 鳴らす là:', 'làm kêu', 'sản phẩm', 'làm hỏng', 'hớn hở', 'làm kêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20218, 52, '1', 'Nghĩa từ Việt của từ 役立つ là:', 'gửi', 'mỏng, nhạt', 'giá cả, vật giá', 'hữu ích', 'hữu ích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20219, 52, '1', 'Nghĩa từ Việt của từ 役立てる là:', 'thông tin truyền thông', 'điều hòa ấm', 'được sử dụng', 'chết', 'được sử dụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20220, 52, '1', 'Nghĩa từ Việt của từ 飾り là:', 'người được nói đến', 'đối lập', 'trang trí', 'cảm thấy', 'trang trí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20221, 52, '1', 'Nghĩa từ Việt của từ 遊び là:', 'loại', 'cao nhất', 'che giấu', 'chơi', 'chơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20222, 52, '1', 'Nghĩa từ Việt của từ 集まり là:', 'giao tiếp', 'tập hợp', 'thất nghiệp', 'tài nguyên', 'tập hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20223, 52, '1', 'Nghĩa từ Việt của từ 教え là:', 'kiểu, thói', 'dạy', 'tìm thấy', 'suốt đời', 'dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20224, 52, '1', 'Nghĩa từ Việt của từ 踊り là:', 'tưởng tượng', 'da', 'nhảy', 'trình độ, level', 'nhảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20225, 52, '1', 'Nghĩa từ Việt của từ 思い là:', 'làm bẩn', 'suy nghĩ, cảm giác', 'sửa', 'thông tin truyền thông', 'suy nghĩ, cảm giác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20226, 52, '1', 'Nghĩa từ Việt của từ 考え là:', 'so sánh', 'nghĩ, ý tưởng', 'thông tin truyền thông', 'qua', 'nghĩ, ý tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20227, 52, '1', 'Nghĩa từ Việt của từ 片づけ là:', 'bắt tay', 'trái cây', 'ngăn nắp', 'khủng khiếp, rất nhiều', 'ngăn nắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20228, 52, '1', 'Nghĩa từ Việt của từ 手伝い là:', 'yêu cầu', 'giúp đỡ', 'nhất định', 'ghi lại', 'giúp đỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20229, 52, '1', 'Nghĩa từ Việt của từ 働き là:', 'hoạt động', 'da', 'tồi', 'làm vỡ', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20230, 52, '1', 'Nghĩa từ Việt của từ 決まり là:', 'làm nguội', 'luật lệ', 'truyền đi, giới thiệu', 'mất điện', 'luật lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20231, 52, '1', 'Nghĩa từ Việt của từ 騒ぎ là:', 'ồn ào, om xòm', 'yên tâm', 'nghỉ việc', 'kiểu, thói', 'ồn ào, om xòm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20232, 52, '1', 'Nghĩa từ Việt của từ 知らせ là:', 'tin tức, thông báo', 'bất an', 'đáy', 'đột nhiên', 'tin tức, thông báo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20233, 52, '1', 'Nghĩa từ Việt của từ 頼み là:', 'hiểu nhầm', 'thịnh vượng', 'yêu cầu', 'bảnh bao', 'yêu cầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20234, 52, '1', 'Nghĩa từ Việt của từ 疲れ là:', 'thành công', 'tráng miệng', 'hồi phục', 'vất vả, mệt mỏi', 'vất vả, mệt mỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20235, 52, '1', 'Nghĩa từ Việt của từ 違い là:', 'chiêu đãi', 'bị thủng', 'bị giảm', 'khác biệt', 'khác biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20236, 52, '1', 'Nghĩa từ Việt của từ 始め là:', 'bị giảm', 'khởi đầu', 'về nhà', 'tự tin', 'khởi đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20237, 52, '1', 'Nghĩa từ Việt của từ 続き là:', 'bất an', 'mất điện', 'rất', 'tiếp tục', 'tiếp tục');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20238, 52, '1', 'Nghĩa từ Việt của từ 暮れ là:', 'cuối năm', 'sâu hơn', 'bị giảm', 'cao lên', 'cuối năm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20239, 52, '1', 'Nghĩa từ Việt của từ 行き là:', 'lạ', 'rung, vẫy', 'sự kiện', 'đi', 'đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20240, 53, '1', 'Nghĩa từ Việt của từ 帰り là:', 'gián đoạn', 'thành công', 'trở về', 'tham dự', 'trở về');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20241, 53, '1', 'Nghĩa từ Việt của từ 急ぎ là:', 'chủ yếu, khá', 'làm hỏng', 'khẩn cấp, vội', 'ghé vào', 'khẩn cấp, vội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20242, 53, '1', 'Nghĩa từ Việt của từ 遅れ là:', 'quốc tế', 'gián đoạn', 'sự kiện', 'da', 'gián đoạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20243, 53, '1', 'Nghĩa từ Việt của từ 貸し là:', 'trung bình', 'cho mượn', 'buồn bã', 'chịu đựng giỏi', 'cho mượn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20244, 53, '1', 'Nghĩa từ Việt của từ 借り là:', 'mượn', 'thông tin truyền thông', 'thông tin truyền thông', 'dựng lên', 'mượn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20245, 53, '1', 'Nghĩa từ Việt của từ 勝ち là:', 'thắng', 'tươi', 'điều hòa ấm', 'làm khô', 'thắng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20246, 53, '1', 'Nghĩa từ Việt của từ 負け là:', 'hớn hở', 'lột', 'thua', 'tiến bộ', 'thua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20247, 53, '1', 'Nghĩa từ Việt của từ 迎え là:', 'lo lắng', 'thiết kế', 'địa phương', 'đón', 'đón');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20248, 53, '1', 'Nghĩa từ Việt của từ 始まり là:', 'bắt đầu', 'tồi', 'bề trên', 'mọc', 'bắt đầu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20249, 53, '1', 'Nghĩa từ Việt của từ 終わり là:', 'khởi động', 'kết thúc', 'vết thương', 'hớn hở', 'kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20250, 53, '1', 'Nghĩa từ Việt của từ 戻り là:', 'nhãn', 'vây quanh', 'bầu cử', 'trở về, trả lại', 'trở về, trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20251, 53, '1', 'Nghĩa từ Việt của từ 別れ là:', 'chia ly', 'người quen', 'bất mãn', 'bị bẩn', 'chia ly');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20252, 53, '1', 'Nghĩa từ Việt của từ 喜び là:', 'hớn hở', 'rán ngập', 'thông tin', 'thực tế là', 'hớn hở');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20253, 53, '1', 'Nghĩa từ Việt của từ 楽しみ là:', 'được dạy', 'dốc', 'đại biểu', 'sung sướng', 'sung sướng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20254, 53, '1', 'Nghĩa từ Việt của từ 笑い là:', 'con dấu', 'tăng lên', 'cười', 'đăng ký', 'cười');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20255, 53, '1', 'Nghĩa từ Việt của từ 驚き là:', 'ghê, siêu', 'đếm', 'mở rộng, bùng phát, lan tràn, trải dài', 'ngạc nhiên', 'ngạc nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20256, 53, '1', 'Nghĩa từ Việt của từ 怒り là:', 'đội', 'giận dữ', 'ăn liền', 'kịp giờ', 'giận dữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20257, 53, '1', 'Nghĩa từ Việt của từ 悲しみ là:', 'chịu đựng giỏi', 'hậu bối', 'chiêu đãi', 'buồn bã', 'buồn bã');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20258, 53, '1', 'Nghĩa từ Việt của từ 幸せな là:', 'hạnh phúc', 'truyền đi, giới thiệu', 'không bao giờ', 'giết', 'hạnh phúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20259, 53, '1', 'Nghĩa từ Việt của từ 得意な là:', 'trình độ, level', 'mạnh, giỏi', 'làm phiền', 'hiểu nhầm', 'mạnh, giỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20260, 53, '1', 'Nghĩa từ Việt của từ 苦手な là:', 'lật lên', 'người được nói đến', 'yếu, kém', 'xung quanh, vòng quanh', 'yếu, kém');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20261, 53, '1', 'Nghĩa từ Việt của từ 熱心な là:', 'chăm chỉ', 'cổ vũ', 'làm khô', 'rủ, mời, gợi ý', 'chăm chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20262, 53, '1', 'Nghĩa từ Việt của từ 夢中な là:', 'thức dậy', 'chú tâm', 'hỏng', 'lừa', 'chú tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20263, 53, '1', 'Nghĩa từ Việt của từ 退屈な là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'thông tin', 'chán', 'tính chất', 'chán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20264, 53, '1', 'Nghĩa từ Việt của từ 健康な là:', 'bầu cử', 'mất', 'phát triển', 'khỏe khoắn', 'khỏe khoắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20265, 53, '1', 'Nghĩa từ Việt của từ 苦しい là:', 'đóng gói', 'thông qua, được chấp nhận, đi qua', 'chắc chắn', 'cực khổ', 'cực khổ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20266, 53, '1', 'Nghĩa từ Việt của từ 平気な là:', 'bình thản', 'tắc đường', 'mỏng, nhạt', 'đường tắt', 'bình thản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20267, 53, '1', 'Nghĩa từ Việt của từ 悔しい là:', 'tự động', 'cay cú', 'nhãn hiệu', 'giả', 'cay cú');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20268, 53, '1', 'Nghĩa từ Việt của từ うらやましい là:', 'mạnh lên', 'quốc tịch', 'ghen tỵ', 'kiên nhẫn, chăm chú, chằm chằm', 'ghen tỵ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20269, 53, '1', 'Nghĩa từ Việt của từ かゆい là:', 'trạng thái', 'ngứa', 'sơn', 'trang trí', 'ngứa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20270, 53, '1', 'Nghĩa từ Việt của từ おとなしい là:', 'trầm lặng', 'tiếp tục, xảy ra liên tiếp', 'xé rách', 'dựng lên', 'trầm lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20271, 53, '1', 'Nghĩa từ Việt của từ 我慢強い là:', 'giải quyết', 'cháy', 'được sinh ra', 'chịu đựng giỏi', 'chịu đựng giỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20272, 53, '1', 'Nghĩa từ Việt của từ 正直な là:', 'ám hiệu', 'thành công', 'kịp giờ', 'trung thực', 'trung thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20273, 53, '1', 'Nghĩa từ Việt của từ けちな là:', 'đổi', 'kẹt xỉ', 'làm bẩn', 'phát kiến', 'kẹt xỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20274, 53, '1', 'Nghĩa từ Việt của từ 我儘な là:', 'đàn ông', 'chiều rộng', 'ích kỷ', 'trình độ, level', 'ích kỷ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20275, 53, '1', 'Nghĩa từ Việt của từ 積極的な là:', 'tránh xa', 'giới thiệu, gợi ý', 'tích cực', 'thông dịch', 'tích cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20276, 53, '1', 'Nghĩa từ Việt của từ 消極的な là:', 'làm mạnh lên', 'người được nói đến', 'gọi', 'tiêu cực', 'tiêu cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20277, 53, '1', 'Nghĩa từ Việt của từ 満足な là:', 'người được nói đến', 'giao vào, lẫn vào', 'thỏa mãn', 'mất điện', 'thỏa mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20278, 53, '1', 'Nghĩa từ Việt của từ 不満な là:', 'thực lực', 'bất mãn', 'thay đổi', 'lo lắng', 'bất mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20279, 53, '1', 'Nghĩa từ Việt của từ 不安な là:', 'bất an', 'tăng lên', 'hàng', 'nhất định', 'bất an');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20280, 53, '1', 'Nghĩa từ Việt của từ 大変な là:', 'bị sai', 'có lẽ', 'riêng biệt', 'tồi tệ', 'tồi tệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20281, 53, '1', 'Nghĩa từ Việt của từ 無理な là:', 'da', 'không ngờ đến', 'vô lý', 'chiêu đãi', 'vô lý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20282, 53, '1', 'Nghĩa từ Việt của từ 不注意な là:', 'nghiện', 'nổi tiếng', 'không chú ý', 'lớn lên, tăng thêm, dài ra', 'không chú ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20283, 53, '1', 'Nghĩa từ Việt của từ 楽な là:', 'cảm động', 'thoải mái', 'hoàn thành', 'nội dung', 'thoải mái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20284, 53, '1', 'Nghĩa từ Việt của từ 面倒な là:', 'được bao phủ', 'tính chất', 'phiền phức', 'chủ yếu, khá', 'phiền phức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20285, 53, '1', 'Nghĩa từ Việt của từ 失礼な là:', 'chính xác', 'thất lễ', 'cầu, khấn', 'sau cùng, cuối cùng, sau tất cả', 'thất lễ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20286, 53, '1', 'Nghĩa từ Việt của từ 当然な là:', 'vừa vặn, đúng', 'da', 'đương nhiên', 'tiếp tục, xảy ra, lặp lại, theo sau', 'đương nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20287, 53, '1', 'Nghĩa từ Việt của từ 意外な là:', 'đối lập', 'người trưởng thành', 'ăn liền', 'không ngờ đến', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20288, 53, '1', 'Nghĩa từ Việt của từ 結構な là:', 'tốt, đủ', 'nhất định', 'giết', 'giống', 'tốt, đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20289, 53, '1', 'Nghĩa từ Việt của từ 派手な là:', 'lòe loẹt', 'cố hương', 'giống', 'mối quan hệ', 'lòe loẹt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20290, 53, '1', 'Nghĩa từ Việt của từ 地味な là:', 'phép trừ, tác động tiêu cực', 'giản dị', 'nuôi(râu)', 'người được nói đến', 'giản dị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20291, 53, '1', 'Nghĩa từ Việt của từ おしゃれな là:', 'đáy', 'ẩn náu, trốn', 'quấn, quàng', 'thời trang, mốt', 'thời trang, mốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20292, 53, '1', 'Nghĩa từ Việt của từ 変な là:', 'dựng lên', 'lạ', 'về nhà', 'bắt tay', 'lạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20293, 53, '1', 'Nghĩa từ Việt của từ 不思議な là:', 'thần bí', 'ngoại lệ', 'tờ rơi', 'hiểu nhầm', 'thần bí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20294, 53, '1', 'Nghĩa từ Việt của từ ましな là:', 'tốt lên', 'bị đâm', 'ghé vào', 'dính, gắn, đạt được, đi cùng với', 'tốt lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20295, 53, '1', 'Nghĩa từ Việt của từ むだな là:', 'tiền lẻ', 'chung', 'quốc tế', 'lãng phí', 'lãng phí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20296, 53, '1', 'Nghĩa từ Việt của từ 自由な là:', 'kết thúc', 'gắn, thêm vào', 'tự do', 'bị đâm', 'tự do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20297, 53, '1', 'Nghĩa từ Việt của từ 不自由な là:', 'cúi chào', 'trái đất', 'tàn tật, không tự do', 'tài nguyên', 'tàn tật, không tự do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20298, 53, '1', 'Nghĩa từ Việt của từ 温まる là:', 'tờ rơi', 'phát minh', 'thần bí', 'trở nên ấm hơn', 'trở nên ấm hơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20299, 53, '1', 'Nghĩa từ Việt của từ 温める là:', 'cấp trên', 'lẫn nhau', 'bị bẩn', 'ấm, nóng', 'ấm, nóng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20300, 53, '1', 'Nghĩa từ Việt của từ 高まる là:', 'cao lên', 'không ngờ đến', 'bị thủng', 'hiểu nhầm', 'cao lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20301, 53, '1', 'Nghĩa từ Việt của từ 高める là:', 'tôn giáo', 'làm cao lên', 'tin đồn', 'trở về, trả lại', 'làm cao lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20302, 53, '1', 'Nghĩa từ Việt của từ 強まる là:', 'nông', 'thay đổi, biến hóa', 'tiết kiệm', 'mạnh lên', 'mạnh lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20303, 53, '1', 'Nghĩa từ Việt của từ 強める là:', 'tiết kiệm', 'làm mạnh lên', 'thừa', 'giao đến', 'làm mạnh lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20304, 53, '1', 'Nghĩa từ Việt của từ 弱まる là:', 'yêu cầu', 'yếu đi', 'giá cả, vật giá', 'giao tiếp', 'yếu đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20305, 53, '1', 'Nghĩa từ Việt của từ 弱める là:', 'chủ đề', 'tiêu đề', 'làm yếu đi', 'xây', 'làm yếu đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20306, 53, '1', 'Nghĩa từ Việt của từ 広まる là:', 'rộng ra', 'tưởng tượng', 'trước', 'hòa bình', 'rộng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20307, 53, '1', 'Nghĩa từ Việt của từ 広める là:', 'nướng, nấu', 'quốc tế', 'làm rộng ra', 'trái đất', 'làm rộng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20308, 53, '1', 'Nghĩa từ Việt của từ 深まる là:', 'chồng lên, tích trữ', 'sâu hơn', 'đông đúc', 'đồng ý', 'sâu hơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20309, 53, '1', 'Nghĩa từ Việt của từ 深める là:', 'bề trên', 'điều hòa ấm', 'làm sâu thêm', 'bị thừa', 'làm sâu thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20310, 53, '1', 'Nghĩa từ Việt của từ 世話 là:', 'làm cho kịp giờ', 'đi làm', 'nghĩ, ý tưởng', 'chăm sóc', 'chăm sóc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20311, 53, '1', 'Nghĩa từ Việt của từ 家庭 là:', 'sản phẩm', 'làm hỏng', 'cuối cùng', 'gia đình', 'gia đình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20312, 53, '1', 'Nghĩa từ Việt của từ 協力 là:', 'sản phẩm', 'hiệp lực', 'ghi lại', 'thông dịch', 'hiệp lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20313, 53, '1', 'Nghĩa từ Việt của từ 感謝 là:', 'phát triển', 'cảm tạ', 'lòe loẹt', 'đi làm, học', 'cảm tạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20314, 53, '1', 'Nghĩa từ Việt của từ お礼 là:', 'đáp lễ', 'tắc đường', 'tiêu cực', 'so sánh', 'đáp lễ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20315, 53, '1', 'Nghĩa từ Việt của từ お詫び là:', 'xin lỗi', 'cay cú', 'phép cộng, tác động tích cực', 'luật lệ', 'xin lỗi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20316, 53, '1', 'Nghĩa từ Việt của từ おじぎ là:', 'tiền bối', 'nuôi(râu)', 'đường tắt', 'cúi chào', 'cúi chào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20317, 53, '1', 'Nghĩa từ Việt của từ 握手 là:', 'phỏng vấn', 'phương đông', 'bắt tay', 'quê quán', 'bắt tay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20318, 53, '1', 'Nghĩa từ Việt của từ いじわる là:', 'thối', 'xấu bụng', 'xuất hiện, được thẻ hiện', 'thuê', 'xấu bụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20319, 53, '1', 'Nghĩa từ Việt của từ いたずら là:', 'nghịch ngợm', 'kiên quyết, chắc chắn, đáng tin cậy', 'phát minh', 'khởi động', 'nghịch ngợm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20320, 53, '1', 'Nghĩa từ Việt của từ 節約 là:', 'phỏng vấn', 'tiết kiệm', 'tiết kiệm', 'đăng ký', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20321, 53, '1', 'Nghĩa từ Việt của từ 経営 là:', 'quản lý', 'máu', 'quê quán', 'kinh doanh, buôn bán', 'quản lý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20322, 53, '1', 'Nghĩa từ Việt của từ 反省 là:', 'người trưởng thành', 'tự kiểm tra', 'cao nhất', 'thú cưng', 'tự kiểm tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20323, 53, '1', 'Nghĩa từ Việt của từ 実行 là:', 'thói quen', 'thực hành', 'đối lập', 'mời, rủ', 'thực hành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20324, 53, '1', 'Nghĩa từ Việt của từ 進歩 là:', 'tiến bộ', 'quốc tế', 'hơn, nữa', 'ôm', 'tiến bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20325, 53, '1', 'Nghĩa từ Việt của từ 変化 là:', 'quan hệ', 'thay đổi, biến hóa', 'luật lệ', 'dũng cảm, dũng khí', 'thay đổi, biến hóa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20326, 53, '1', 'Nghĩa từ Việt của từ 発達 là:', 'chịu đựng', 'làm tăng lên', 'phát triển', 'bầu cử', 'phát triển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20327, 53, '1', 'Nghĩa từ Việt của từ 体力 là:', 'thể lực', 'tin đồn', 'tăng giá', 'sự kiện', 'thể lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20328, 53, '1', 'Nghĩa từ Việt của từ 出場 là:', 'đại thể, thường', 'bị ướt', 'tham dự', 'bầu cử', 'tham dự');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20329, 53, '1', 'Nghĩa từ Việt của từ 活躍 là:', 'giết', 'hoạt động', 'dạy', 'gián đoạn', 'hoạt động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20330, 53, '1', 'Nghĩa từ Việt của từ 競争 là:', 'lạ', 'khát', 'bao gồm', 'cạnh tranh', 'cạnh tranh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20331, 53, '1', 'Nghĩa từ Việt của từ 応援 là:', 'cổ vũ', 'bị tràn', 'vô lý', 'nguyên nhân', 'cổ vũ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20332, 53, '1', 'Nghĩa từ Việt của từ 拍手 là:', 'yêu', 'vỗ tay', 'đối lập', 'cổ vũ', 'vỗ tay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20333, 53, '1', 'Nghĩa từ Việt của từ 人気 là:', 'vỗ tay', 'nổi tiếng', 'bị đánh', 'bị đánh', 'nổi tiếng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20334, 53, '1', 'Nghĩa từ Việt của từ うわさ là:', 'vỗ tay', 'loại', 'lỗ', 'tin đồn', 'tin đồn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20335, 53, '1', 'Nghĩa từ Việt của từ 情報 là:', 'thông tin', 'mọc', 'bắt', 'tình cờ thấy', 'thông tin');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20336, 53, '1', 'Nghĩa từ Việt của từ 交換 là:', 'trao đổi', 'thuê', 'đại biểu', 'được quyết định', 'trao đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20337, 53, '1', 'Nghĩa từ Việt của từ 流行 là:', 'cho xuống', 'thông dịch', 'máy tính tiền', 'trào lưu', 'trào lưu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20338, 53, '1', 'Nghĩa từ Việt của từ 宣伝 là:', 'đun sôi', 'tuyên truyền', 'bắt', 'kết nối, làm chặt thêm', 'tuyên truyền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20339, 53, '1', 'Nghĩa từ Việt của từ 広告 là:', 'chôn', 'trung bình', 'người đối diện', 'quảng cáo', 'quảng cáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20340, 53, '1', 'Nghĩa từ Việt của từ 注目 là:', 'đường tắt', 'bị gãy', 'chú trọng', 'kết quả', 'chú trọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20341, 53, '1', 'Nghĩa từ Việt của từ 通訳 là:', 'nữa', 'thông dịch', 'xé rách', 'thông dịch', 'thông dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20342, 53, '1', 'Nghĩa từ Việt của từ 翻訳 là:', 'trao đổi, làm việc', 'biên dịch', 'cuối cùng, vừa đủ', 'không bao giờ', 'biên dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20343, 53, '1', 'Nghĩa từ Việt của từ 伝言 là:', 'bị thừa', 'tràn', 'tai nạn', 'tin nhắn thoại', 'tin nhắn thoại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20344, 53, '1', 'Nghĩa từ Việt của từ 報告 là:', 'báo cáo', 'nấm mốc', 'mọc', 'nấm mốc', 'báo cáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20345, 53, '1', 'Nghĩa từ Việt của từ 録画 là:', 'tiền bối', 'bị đánh', 'ghi lại', 'chăm sóc', 'ghi lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20346, 53, '1', 'Nghĩa từ Việt của từ 混雑 là:', 'bắt nạt', 'giới thiệu, gợi ý', 'hỗn tạp', 'khác', 'hỗn tạp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20347, 53, '1', 'Nghĩa từ Việt của từ 渋滞 là:', 'thế kỷ', 'chiều cao', 'tắc đường', 'cao nhất', 'tắc đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20348, 53, '1', 'Nghĩa từ Việt của từ 衝突 là:', 'mượn', 'gần như hoàn toàn', 'chôn', 'xung đột', 'xung đột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20349, 53, '1', 'Nghĩa từ Việt của từ 被害 là:', 'lừa', 'cơ bản', 'thiệt hại', 'được giao đến', 'thiệt hại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20350, 53, '1', 'Nghĩa từ Việt của từ 事故 là:', 'tai nạn', 'tiến bộ', 'đổ', 'nhảy', 'tai nạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20351, 53, '1', 'Nghĩa từ Việt của từ 事件 là:', 'dự phòng', 'vây quanh', 'tiến lên', 'sự kiện', 'sự kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20352, 53, '1', 'Nghĩa từ Việt của từ 故障 là:', 'nguyên nhân', 'hỏng', 'bị đánh', 'cao nhất', 'hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20353, 53, '1', 'Nghĩa từ Việt của từ 修理 là:', 'báo cáo', 'phát kiến', 'sửa chữa', 'nguyên nhân', 'sửa chữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20354, 53, '1', 'Nghĩa từ Việt của từ 停電 là:', 'qua', 'xây', 'mất điện', 'suốt, nhiều', 'mất điện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20355, 53, '1', 'Nghĩa từ Việt của từ 調子 là:', 'làm tăng lên', 'suy nghĩ, cảm giác', 'hoàn thành', 'trạng thái', 'trạng thái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20356, 53, '1', 'Nghĩa từ Việt của từ 緊張 là:', 'nhớ lại', 'lo lắng', 'quen', 'sửa', 'lo lắng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20357, 53, '1', 'Nghĩa từ Việt của từ 自身 là:', 'tự tin', 'người trưởng thành', 'mở thêm, mở rộng, nới rộng, mở ra', 'đăng ký', 'tự tin');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20358, 53, '1', 'Nghĩa từ Việt của từ 自慢 là:', 'tốt, đủ', 'tự mãn', 'giới thiệu, gợi ý', 'bất an', 'tự mãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20359, 53, '1', 'Nghĩa từ Việt của từ 感心 là:', 'phát minh', 'quan tâm', 'làm cho kịp giờ', 'rất', 'quan tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20360, 54, '1', 'Nghĩa từ Việt của từ 感動 là:', 'cảm động', 'phát triển', 'giết', 'chồng lên, tích trữ', 'cảm động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20361, 54, '1', 'Nghĩa từ Việt của từ 興奮 là:', 'được chia ra', 'hưng phấn', 'tách ra', 'chôn', 'hưng phấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20362, 54, '1', 'Nghĩa từ Việt của từ 感想 là:', 'rất', 'cảm tưởng', 'tiến lên', 'hàng', 'cảm tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20363, 54, '1', 'Nghĩa từ Việt của từ 予想 là:', 'truyền đi, giới thiệu', 'người được nói đến', 'dự đoán', 'so sánh', 'dự đoán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20364, 54, '1', 'Nghĩa từ Việt của từ 専門 là:', 'chuyên môn', 'làm mạnh lên', 'lừa', 'ghê, siêu', 'chuyên môn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20365, 54, '1', 'Nghĩa từ Việt của từ 研究 là:', 'dính, gắn, đạt được, đi cùng với', 'được sử dụng', 'khởi đầu', 'nghiên cứu', 'nghiên cứu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20366, 54, '1', 'Nghĩa từ Việt của từ 調査 là:', 'quan tâm, thông cảm', 'điều tra', 'tiến bộ', 'mất', 'điều tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20367, 54, '1', 'Nghĩa từ Việt của từ 原因 là:', 'sau cùng, cuối cùng, sau tất cả', 'buồn bã', 'nguyên nhân', 'trượt', 'nguyên nhân');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20368, 54, '1', 'Nghĩa từ Việt của từ 結果 là:', 'kết quả', 'top', 'yêu cầu', 'vô ý, buột', 'kết quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20369, 54, '1', 'Nghĩa từ Việt của từ 解決 là:', 'giải quyết', 'robot', 'thiết kế', 'giao tiếp', 'giải quyết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20370, 54, '1', 'Nghĩa từ Việt của từ 確認 là:', 'khát', 'cháy', 'xác nhận', 'tôn giáo', 'xác nhận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20371, 54, '1', 'Nghĩa từ Việt của từ 利用 là:', 'có lẽ', 'tránh xa', 'sử dụng', 'nghĩ, ý tưởng', 'sử dụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20372, 54, '1', 'Nghĩa từ Việt của từ 理解 là:', 'chính xác', 'khác', 'dựng lên', 'lý giải', 'lý giải');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20373, 54, '1', 'Nghĩa từ Việt của từ 発見 là:', 'bị bẩn', 'phát kiến', 'bất mãn', 'chỉnh sửa', 'phát kiến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20374, 54, '1', 'Nghĩa từ Việt của từ 発明 là:', 'chiều rộng', 'phát minh', 'tính cách', 'thực hành', 'phát minh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20375, 54, '1', 'Nghĩa từ Việt của từ 関係 là:', 'quan hệ', 'tình nguyện', 'kinh doanh, buôn bán', 'thức xuyên đêm', 'quan hệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20376, 54, '1', 'Nghĩa từ Việt của từ 団体 là:', 'đoàn thể', 'báo cáo', 'trước', 'hớn hở', 'đoàn thể');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20377, 54, '1', 'Nghĩa từ Việt của từ 選挙 là:', 'tổ chức', 'bầu cử', 'trình độ, level', 'thể lực', 'bầu cử');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20378, 54, '1', 'Nghĩa từ Việt của từ 税金 là:', 'bị giảm', 'giải quyết, nóng chảy', 'thuế', 'làm tăng lên', 'thuế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20379, 54, '1', 'Nghĩa từ Việt của từ 責任 là:', 'trách nhiệm', 'lễ nghĩa', 'bề trên', 'thế kỷ', 'trách nhiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20380, 54, '1', 'Nghĩa từ Việt của từ 書類 là:', 'cố hương', 'thăm', 'đáy', 'tài liệu', 'tài liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20381, 54, '1', 'Nghĩa từ Việt của từ 題名 là:', 'tiêu đề', 'ngủ', 'tồi', 'giết', 'tiêu đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20382, 54, '1', 'Nghĩa từ Việt của từ 条件 là:', 'nỗ lực', 'danh thiếp', 'điều kiện', 'ngủ', 'điều kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20383, 54, '1', 'Nghĩa từ Việt của từ 締め切り là:', 'hạn cuối', 'thức dậy', 'đông đúc', 'thế kỷ', 'hạn cuối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20384, 54, '1', 'Nghĩa từ Việt của từ 期間 là:', 'thuê', 'thời gian, thời kỳ', 'tai nạn', 'bị gãy', 'thời gian, thời kỳ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20385, 54, '1', 'Nghĩa từ Việt của từ 倍 là:', 'tổ chức', 'yên tâm', 'yên tâm', 'lần', 'lần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20386, 54, '1', 'Nghĩa từ Việt của từ くじ là:', 'thất nghiệp', 'xổ số, rút thăm', 'yên tâm', 'làm vỡ', 'xổ số, rút thăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20387, 54, '1', 'Nghĩa từ Việt của từ 近道 là:', 'so sánh', 'ghê, siêu', 'đại biểu', 'đường tắt', 'đường tắt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20388, 54, '1', 'Nghĩa từ Việt của từ 中心 là:', 'rất', 'trung tâm', 'nhẹ nhàng, yên lặng', 'được quyết định', 'trung tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20389, 54, '1', 'Nghĩa từ Việt của từ 辺り là:', 'gần, lân cận', 'đi làm, học', 'quan hệ', 'ngạc nhiên', 'gần, lân cận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20390, 54, '1', 'Nghĩa từ Việt của từ 周り là:', 'xung quanh, vòng quanh', 'được xây', 'cao nhất', 'biểu hiện (trên mặt)', 'xung quanh, vòng quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20391, 54, '1', 'Nghĩa từ Việt của từ 穴 là:', 'ngủ', 'hớn hở', 'tiền bối', 'lỗ', 'lỗ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20392, 54, '1', 'Nghĩa từ Việt của từ 列 là:', 'thấp nhất', 'suốt, nhiều', 'hàng', 'nghỉ việc', 'hàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20393, 54, '1', 'Nghĩa từ Việt của từ 幅 là:', 'thiệt hại', 'đổ', 'chiều rộng', 'trao, cung cấp', 'chiều rộng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20394, 54, '1', 'Nghĩa từ Việt của từ 範囲 là:', 'nông', 'phạm vi', 'chua', 'loại', 'phạm vi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20395, 54, '1', 'Nghĩa từ Việt của từ 内容 là:', 'suốt đời', 'nhớ lại', 'vất vả, mệt mỏi', 'nội dung', 'nội dung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20396, 54, '1', 'Nghĩa từ Việt của từ 中身 là:', 'trái đất', 'robot', 'bên trong', 'cảm thấy', 'bên trong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20397, 54, '1', 'Nghĩa từ Việt của từ 特徴 là:', 'đông đúc', 'có thể, được xây dựng', 'đặc trưng', 'lặp lại', 'đặc trưng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20398, 54, '1', 'Nghĩa từ Việt của từ 普通 là:', 'đun sôi', 'bình thường', 'nắm chặt', 'cảm thấy', 'bình thường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20399, 54, '1', 'Nghĩa từ Việt của từ 当たり前 là:', 'hiểu nhầm', 'có lẽ', 'đương nhiên', 'ảnh hưởng', 'đương nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20400, 54, '1', 'Nghĩa từ Việt của từ 偽 là:', 'hội, tiệc', 'giả', 'đích thực', 'suốt đời', 'giả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20401, 54, '1', 'Nghĩa từ Việt của từ 別 là:', 'gián đoạn', 'dựng lên', 'khác', 'chán', 'khác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20402, 54, '1', 'Nghĩa từ Việt của từ 国籍 là:', '(không) có gì', 'lãnh đạo', 'quốc tịch', 'sự kiện', 'quốc tịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20403, 54, '1', 'Nghĩa từ Việt của từ 東洋 là:', 'phương đông', 'thông tin truyền thông', 'yêu cầu', 'nuôi(râu)', 'phương đông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20404, 54, '1', 'Nghĩa từ Việt của từ 西洋 là:', 'sản phẩm', 'lấy cắp', 'phương tây', 'sau cùng, cuối cùng, sau tất cả', 'phương tây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20405, 54, '1', 'Nghĩa từ Việt của từ 国際 là:', 'quen', 'đón', 'quốc tế', 'có hiệu quả', 'quốc tế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20406, 54, '1', 'Nghĩa từ Việt của từ 自然 là:', 'giả', 'tự nhiên', 'tiến bộ', 'điều hòa ấm', 'tự nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20407, 54, '1', 'Nghĩa từ Việt của từ 景色 là:', 'phong cảnh', 'thông tin truyền thông', 'thử', 'làm bẩn', 'phong cảnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20408, 54, '1', 'Nghĩa từ Việt của từ 宗教 là:', 'ngủ', 'hướng đến, quay', 'tôn giáo', 'hội, tiệc', 'tôn giáo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20409, 54, '1', 'Nghĩa từ Việt của từ 愛 là:', 'lấy cắp', 'mang đến gần', 'yêu', 'làm bẩn', 'yêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20410, 54, '1', 'Nghĩa từ Việt của từ 届く là:', 'được giao đến', 'nghiện', 'hóa đơn', 'nắm chặt', 'được giao đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20411, 54, '1', 'Nghĩa từ Việt của từ 届ける là:', 'thăm', 'xuất hiện, được thẻ hiện', 'say', 'giao đến', 'giao đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20412, 54, '1', 'Nghĩa từ Việt của từ かく là:', 'quốc tế', 'gãi', 'cháy', 'trạng thái', 'gãi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20413, 54, '1', 'Nghĩa từ Việt của từ つかむ là:', 'trở về, trả lại', 'tóm, chộp', 'đun sôi', 'khác', 'tóm, chộp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20414, 54, '1', 'Nghĩa từ Việt của từ 握る là:', 'bị gãy', 'thử thách', 'sửa chữa', 'nắm chặt', 'nắm chặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20415, 54, '1', 'Nghĩa từ Việt của từ 抑える là:', 'da', 'sôi', 'loáng một cái', 'giữ', 'giữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20416, 54, '1', 'Nghĩa từ Việt của từ 近づく là:', 'ngoại lệ', 'lại gần', 'hỏng', 'phát minh', 'lại gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20417, 54, '1', 'Nghĩa từ Việt của từ 近づける là:', 'kiến thức', 'so sánh', 'thịnh vượng', 'mang đến gần', 'mang đến gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20418, 54, '1', 'Nghĩa từ Việt của từ 合う là:', 'sạch', 'động lực', 'gặp', 'tiến lên', 'gặp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20419, 54, '1', 'Nghĩa từ Việt của từ 合わせる là:', 'tin tức, thông báo', 'nhiệt độ', 'thế kỷ', 'tập hợp, hiệp lực', 'tập hợp, hiệp lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20420, 54, '1', 'Nghĩa từ Việt của từ 当たる là:', 'bị sai', 'con dấu', 'bị đánh', 'đường tắt', 'bị đánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20421, 54, '1', 'Nghĩa từ Việt của từ 当てる là:', 'bị chôn', 'đánh', 'hữu ích', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'đánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20422, 54, '1', 'Nghĩa từ Việt của từ 比べる là:', 'thu thập, được thu thập', 'thông dịch', 'so sánh', 'được tích tụ', 'so sánh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20423, 54, '1', 'Nghĩa từ Việt của từ 似合う là:', 'hợp', 'làm mạnh lên', 'bao gồm', 'bảo vệ', 'hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20424, 54, '1', 'Nghĩa từ Việt của từ 似る là:', 'thịnh vượng', 'lừa', 'giống', 'top', 'giống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20425, 54, '1', 'Nghĩa từ Việt của từ 似せる là:', 'cấp trên', 'chăm sóc', 'ngoại lệ', 'bắt chước', 'bắt chước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20426, 54, '1', 'Nghĩa từ Việt của từ 分かれる là:', 'tự do', 'tách ra', 'phát kiến', 'được chia ra', 'được chia ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20427, 54, '1', 'Nghĩa từ Việt của từ 分ける là:', 'giao đến', 'ghê, siêu', 'chia', 'trình độ, level', 'chia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20428, 54, '1', 'Nghĩa từ Việt của từ 足す là:', 'cộng, thêm vào', 'dán', 'nấm mốc', 'người trưởng thành', 'cộng, thêm vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20429, 54, '1', 'Nghĩa từ Việt của từ 引く là:', 'xung quanh, vòng quanh', 'kéo, trừ', 'làm hỏng', 'xấu bụng', 'kéo, trừ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20430, 54, '1', 'Nghĩa từ Việt của từ 増える là:', 'bị gãy', 'tăng lên', 'tiến lên', 'so sánh', 'tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20431, 54, '1', 'Nghĩa từ Việt của từ 増やす là:', 'ghé vào', 'cuối cùng, vừa đủ', 'làm tăng lên', 'trình độ, level', 'làm tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20432, 54, '1', 'Nghĩa từ Việt của từ 減る là:', 'tàn tật, không tự do', 'ngạc nhiên', 'giảm xuống', 'vất vả, mệt mỏi', 'giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20433, 54, '1', 'Nghĩa từ Việt của từ 減らす là:', 'thăm', 'cố hương', 'làm giảm xuống', 'cao nhất', 'làm giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20434, 54, '1', 'Nghĩa từ Việt của từ 変わる là:', 'ngầm', 'thay đổi', 'giúp đỡ', 'bị ướt', 'thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20435, 54, '1', 'Nghĩa từ Việt của từ 変える là:', 'làm thay đổi', 'bảo vệ', 'xấu bụng', 'làm yếu đi', 'làm thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20436, 54, '1', 'Nghĩa từ Việt của từ 代わる・替わる・換わる là:', 'cay cú', 'thay', 'giết', 'dựng lên', 'thay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20437, 54, '1', 'Nghĩa từ Việt của từ 代える・替える・換える là:', 'được quyết định', 'đổi', 'phương đông', 'mặt trời', 'đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20438, 54, '1', 'Nghĩa từ Việt của từ 返る là:', 'được trả lại', 'được nấu', 'luật lệ', 'hơi ẩm', 'được trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20439, 54, '1', 'Nghĩa từ Việt của từ 返す là:', 'cho bay', 'nghĩ về', 'trả lại', 'thiết kế', 'trả lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20440, 54, '1', 'Nghĩa từ Việt của từ 譲る là:', 'chôn', 'nhường', 'làm khô', 'bầu cử', 'nhường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20441, 54, '1', 'Nghĩa từ Việt của từ 助かる là:', 'được giúp', 'tràn', 'nghỉ việc', 'tự tin', 'được giúp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20442, 54, '1', 'Nghĩa từ Việt của từ 助ける là:', 'suốt đời', 'giúp', 'tự động', 'vỗ tay', 'giúp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20443, 54, '1', 'Nghĩa từ Việt của từ いじめる là:', 'bắt nạt', 'đồng ý', 'xuất hiện, được thẻ hiện', 'người được nói đến', 'bắt nạt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20444, 54, '1', 'Nghĩa từ Việt của từ だまる là:', 'lừa', 'say', 'mối quan hệ', 'bị giảm', 'lừa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20445, 54, '1', 'Nghĩa từ Việt của từ 盗む là:', 'trái cây', 'trình độ, level', 'cảm thấy', 'lấy cắp', 'lấy cắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20446, 54, '1', 'Nghĩa từ Việt của từ 刺さる là:', 'kiểu, thói', 'thói quen', 'được bao phủ', 'bị đâm', 'bị đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20447, 54, '1', 'Nghĩa từ Việt của từ 刺す là:', 'đâm', 'tắc đường', 'đi làm, học', 'bầu cử', 'đâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20448, 54, '1', 'Nghĩa từ Việt của từ 殺す là:', 'toàn bộ', 'tự động', 'rõ ràng', 'giết', 'giết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20449, 54, '1', 'Nghĩa từ Việt của từ 隠れる là:', 'giết', 'ẩn náu, trốn', 'xung quanh, vòng quanh', 'quốc tịch', 'ẩn náu, trốn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20450, 54, '1', 'Nghĩa từ Việt của từ 隠す là:', 'che giấu', 'phương đông', 'ghi lại', 'trở về, trả lại', 'che giấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20451, 54, '1', 'Nghĩa từ Việt của từ 埋まる là:', 'kết nối, làm chặt thêm', 'suốt, nhiều', 'khác', 'bị chôn', 'bị chôn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20452, 54, '1', 'Nghĩa từ Việt của từ 埋める là:', 'truyền đi, giới thiệu', 'dựng lên', 'chôn', 'thông báo', 'chôn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20453, 54, '1', 'Nghĩa từ Việt của từ 囲む là:', 'bị thừa', 'đáy', 'vây quanh', 'nuôi(râu)', 'vây quanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20454, 54, '1', 'Nghĩa từ Việt của từ 詰まる là:', 'được chia ra', 'đăng ký, ứng tuyển', 'đầy, chặt', 'buồn bã', 'đầy, chặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20455, 54, '1', 'Nghĩa từ Việt của từ 詰める là:', 'trưởng thành', 'thành phố', 'đóng gói', 'làm bẩn', 'đóng gói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20456, 54, '1', 'Nghĩa từ Việt của từ 開く là:', 'ghê, siêu', 'thất lễ', 'mở', 'rán ngập', 'mở');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20457, 54, '1', 'Nghĩa từ Việt của từ 閉じる là:', 'chi tiết', 'dđóng', 'nhựa', 'thuê', 'dđóng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20458, 54, '1', 'Nghĩa từ Việt của từ 飛ぶ là:', 'bay', 'truyền đi, giới thiệu', 'bắt nạt', 'thế kỷ', 'bay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20459, 54, '1', 'Nghĩa từ Việt của từ 飛ばす là:', 'cho bay', 'trang trí', 'quê quán', 'nữa', 'cho bay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20460, 54, '1', 'Nghĩa từ Việt của từ 振る là:', 'rung, vẫy', 'lỗ', '(không) tí gì', 'người được nói đến', 'rung, vẫy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20461, 54, '1', 'Nghĩa từ Việt của từ めくる là:', 'tiền lẻ', 'lật lên', 'card', 'nhựa', 'lật lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20462, 54, '1', 'Nghĩa từ Việt của từ 見かける là:', 'trình độ, level', 'làm mạnh lên', 'hình ảnh', 'tình cờ thấy', 'tình cờ thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20463, 54, '1', 'Nghĩa từ Việt của từ 確かめる là:', 'chôn', 'kiểm tra lại', 'thấp nhất', 'thông tin', 'kiểm tra lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20464, 54, '1', 'Nghĩa từ Việt của từ 試す là:', 'thua', 'thực hành', 'được bao phủ', 'thử', 'thử');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20465, 54, '1', 'Nghĩa từ Việt của từ 繰り返す là:', 'giúp đỡ', 'vượt qua', 'lặp lại', 'chắc chắn', 'lặp lại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20466, 54, '1', 'Nghĩa từ Việt của từ 訳す là:', 'ngủ', 'thuê', 'kết quả', 'dịch', 'dịch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20467, 54, '1', 'Nghĩa từ Việt của từ 行う là:', 'ảnh hưởng', 'tổ chức', 'thông dịch', 'giới thiệu, gợi ý', 'tổ chức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20468, 54, '1', 'Nghĩa từ Việt của từ 間違う là:', 'da', 'danh thiếp', 'dọn dẹp', 'bị sai', 'bị sai');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20469, 54, '1', 'Nghĩa từ Việt của từ 間違える là:', 'sự kiện', 'yên tâm', 'làm sai', 'đăng ký', 'làm sai');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20470, 54, '1', 'Nghĩa từ Việt của từ 許す là:', 'bị ướt', 'tha thứ, cho phép', 'qua', 'thăm', 'tha thứ, cho phép');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20471, 54, '1', 'Nghĩa từ Việt của từ 慣れる là:', 'quen', 'cảm động', 'hàng', 'đổ', 'quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20472, 54, '1', 'Nghĩa từ Việt của từ 慣らす là:', 'khởi động', 'cao nhất', 'phát kiến', 'đại thể, thường', 'khởi động');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20473, 54, '1', 'Nghĩa từ Việt của từ 立つ là:', 'ngủ', 'người được nói đến', 'da', 'đứng', 'đứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20474, 54, '1', 'Nghĩa từ Việt của từ 立てる là:', 'bảnh bao', 'đánh thức', 'thiệt hại', 'dựng lên', 'dựng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20475, 54, '1', 'Nghĩa từ Việt của từ 建つ là:', 'trào lưu', 'được xây', 'điều kiện', 'vượt qua', 'được xây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20476, 54, '1', 'Nghĩa từ Việt của từ 建てる là:', 'bao phủ', 'xây', 'được sinh ra', 'khởi đầu', 'xây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20477, 54, '1', 'Nghĩa từ Việt của từ 育つ là:', 'vừa, được công bố', 'được giúp', 'xuất hiện, hiện ra', 'được nuôi dạy', 'được nuôi dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20478, 54, '1', 'Nghĩa từ Việt của từ 育てる là:', 'nuôi, dạy', 'được sinh ra', 'lý do', 'tiền bối', 'nuôi, dạy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20479, 54, '1', 'Nghĩa từ Việt của từ 生える là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'thói quen', 'thú cưng', 'mọc', 'mọc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20480, 55, '1', 'Nghĩa từ Việt của từ 生やす là:', 'nuôi(râu)', 'đặt hàng', 'được sửa', 'tiến bộ', 'nuôi(râu)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20481, 55, '1', 'Nghĩa từ Việt của từ 汚れる là:', 'bị bẩn', 'vượt, lướt', 'nghĩ về', 'giao tiếp', 'bị bẩn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20482, 55, '1', 'Nghĩa từ Việt của từ 汚す là:', 'vây quanh', 'làm bẩn', 'cháy', 'thực tế là', 'làm bẩn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20483, 55, '1', 'Nghĩa từ Việt của từ 壊れる là:', 'ghi lại', 'danh thiếp', 'sơn', 'bị hỏng', 'bị hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20484, 55, '1', 'Nghĩa từ Việt của từ 壊す là:', 'làm hỏng', 'bị chôn', 'bị tràn', 'tiết kiệm', 'làm hỏng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20485, 55, '1', 'Nghĩa từ Việt của từ 割れる là:', 'kết quả', 'tiết kiệm', 'bị vỡ', 'rõ ràng', 'bị vỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20486, 55, '1', 'Nghĩa từ Việt của từ 割る là:', 'tiền bối', 'phát triển', 'làm vỡ', 'thiết kế', 'làm vỡ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20487, 55, '1', 'Nghĩa từ Việt của từ 折れる là:', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'bị gãy', 'trình độ, level', 'cơ bản', 'bị gãy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20488, 55, '1', 'Nghĩa từ Việt của từ 折る là:', 'làm gãy', 'tin đồn', 'hòa bình', 'chủ đề', 'làm gãy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20489, 55, '1', 'Nghĩa từ Việt của từ 破れる là:', 'nhựa', 'bị rách', 'thông tin', 'thịnh vượng', 'bị rách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20490, 55, '1', 'Nghĩa từ Việt của từ 破る là:', 'xung quanh, vòng quanh', 'lần', 'gọi', 'xé rách', 'xé rách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20491, 55, '1', 'Nghĩa từ Việt của từ 曲がる là:', 'gập, cong', 'sôi', 'làm cho kịp giờ', 'thấp nhất', 'gập, cong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20492, 55, '1', 'Nghĩa từ Việt của từ 曲げる là:', 'trạng thái', 'hối hận', 'hiểu nhầm', 'bẻ, uốn', 'bẻ, uốn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20493, 55, '1', 'Nghĩa từ Việt của từ 外れる là:', 'bị rời ra', 'tai nạn', 'làm thay đổi', 'ngủ', 'bị rời ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20494, 55, '1', 'Nghĩa từ Việt của từ 外す là:', 'hòa bình', 'giúp', 'dựng lên', 'tách ra', 'tách ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20495, 55, '1', 'Nghĩa từ Việt của từ 揺れる là:', 'cố hương', 'làm thêm', 'bị rung', 'về nước', 'bị rung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20496, 55, '1', 'Nghĩa từ Việt của từ 揺らす là:', 'đung đưa', 'bắt', 'đại thể, thường', 'sản phẩm', 'đung đưa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20497, 55, '1', 'Nghĩa từ Việt của từ 流れる là:', 'bị chôn', 'giới thiệu, gợi ý', 'chảy', 'máy tính tiền', 'chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20498, 55, '1', 'Nghĩa từ Việt của từ 流す là:', 'khói', 'cho chảy', 'tráng miệng', 'da', 'cho chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20499, 55, '1', 'Nghĩa từ Việt của từ 濡れる là:', 'chói', 'tính chất', 'được bao phủ', 'bị ướt', 'bị ướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20500, 55, '1', 'Nghĩa từ Việt của từ 濡らす là:', 'làm ướt', 'nghĩ, ý tưởng', 'thật lòng, kỳ thực', 'bất an', 'làm ướt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20501, 55, '1', 'Nghĩa từ Việt của từ 迷う là:', 'lạc đường', 'thuê', 'kinh doanh, buôn bán', 'tự động', 'lạc đường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20502, 55, '1', 'Nghĩa từ Việt của từ 悩む là:', 'thuê', 'chán', 'mời, rủ', 'băn khoăn', 'băn khoăn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20503, 55, '1', 'Nghĩa từ Việt của từ 慌てる là:', 'rõ ràng', 'người được nói đến', 'vội vàng', 'thực hành', 'vội vàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20504, 55, '1', 'Nghĩa từ Việt của từ 覚める là:', 'thức dậy', 'tờ rơi', 'nói chuyện riêng', 'vội vàng', 'thức dậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20505, 55, '1', 'Nghĩa từ Việt của từ 覚ます là:', 'mở mắt, tỉnh', 'khẩn cấp, vội', 'chứa, bao gồm', 'con dấu', 'mở mắt, tỉnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20506, 55, '1', 'Nghĩa từ Việt của từ 眠る là:', 'ngủ', 'báo cáo', 'phép trừ, tác động tiêu cực', 'danh thiếp', 'ngủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20507, 55, '1', 'Nghĩa từ Việt của từ 祈る là:', 'cửa hàng tiện ích', 'cầu, khấn', 'tình cờ thấy', 'giận dữ', 'cầu, khấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20508, 55, '1', 'Nghĩa từ Việt của từ 祝う là:', 'được sử dụng', 'băn khoăn', 'sau cùng, cuối cùng, sau tất cả', 'ăn mừng', 'ăn mừng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20509, 55, '1', 'Nghĩa từ Việt của từ 感じる là:', 'cảm thấy', 'được chuyển', 'chiều rộng', 'nhãn', 'cảm thấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20510, 55, '1', 'Nghĩa từ Việt của từ クラスメート là:', 'hỏng', 'bạn cùng lớp', 'nhãn', 'hiểu, thông qua', 'bạn cùng lớp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20511, 55, '1', 'Nghĩa từ Việt của từ グループ là:', 'truyền đi, giới thiệu', 'nhóm', 'tốt, đủ', 'người được nói đến', 'nhóm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20512, 55, '1', 'Nghĩa từ Việt của từ チーム là:', 'quốc tịch', 'tổ chức', 'đội', 'trình độ, level', 'đội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20513, 55, '1', 'Nghĩa từ Việt của từ プロフェッショナル là:', 'làm bẩn', 'làm phiền', 'chuyên nghiệp', 'làm mạnh lên', 'chuyên nghiệp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20514, 55, '1', 'Nghĩa từ Việt của từ アマチュア là:', 'nghiệp dư', 'giữ', 'suy nghĩ, cảm giác', 'trình độ, level', 'nghiệp dư');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20515, 55, '1', 'Nghĩa từ Việt của từ トレーニング là:', 'cao nhất', 'chính xác', 'đào tạo', 'nấm mốc', 'đào tạo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20516, 55, '1', 'Nghĩa từ Việt của từ マッサージ là:', 'nhóm', 'bị chôn', 'lo lắng', 'mát xa', 'mát xa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20517, 55, '1', 'Nghĩa từ Việt của từ アドバイス là:', 'khuyên', 'hơn nữa', 'trình độ, level', 'ra đời', 'khuyên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20518, 55, '1', 'Nghĩa từ Việt của từ アイデア・アイディア là:', 'giúp đỡ', 'làm hỏng', 'ý tưởng', 'thiệt hại', 'ý tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20519, 55, '1', 'Nghĩa từ Việt của từ トップ là:', 'mời, rủ', 'top', 'phát triển', 'chiêu đãi', 'top');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20520, 55, '1', 'Nghĩa từ Việt của từ スピード là:', 'chủ đề', 'sắp', 'tình nguyện', 'tốc độ', 'tốc độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20521, 55, '1', 'Nghĩa từ Việt của từ ラッシュ là:', 'ảnh hưởng', 'ăn liền', 'thông dịch', 'đông đúc', 'đông đúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20522, 55, '1', 'Nghĩa từ Việt của từ バイク là:', 'xe máy', 'người được nói đến', 'trạng thái', 'mở thêm, mở rộng, nới rộng, mở ra', 'xe máy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20523, 55, '1', 'Nghĩa từ Việt của từ ヘルメット là:', 'tai nạn', 'thử thách', 'khá', 'mũ bảo hiểm', 'mũ bảo hiểm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20524, 55, '1', 'Nghĩa từ Việt của từ コンタクトレンズ là:', 'card', 'tránh xa', 'kính áp tròng', 'phát minh', 'kính áp tròng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20525, 55, '1', 'Nghĩa từ Việt của từ ガラス là:', 'kính', 'chiêu đãi', 'mời, rủ', 'thiệt hại', 'kính');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20526, 55, '1', 'Nghĩa từ Việt của từ プラスチック là:', 'sống', 'cảm động', 'nhựa', 'rán ngập', 'nhựa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20527, 55, '1', 'Nghĩa từ Việt của từ ベランダ là:', 'ban công', 'ngon', 'thuê', 'ăn liền', 'ban công');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20528, 55, '1', 'Nghĩa từ Việt của từ ペット là:', 'đào tạo', 'mở thêm, mở rộng, nới rộng, mở ra', 'thú cưng', 'tóm, chộp', 'thú cưng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20529, 55, '1', 'Nghĩa từ Việt của từ ベンチ là:', 'tự động', 'bị bẩn', 'ghế bành', 'không thể ngờ, không', 'ghế bành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20530, 55, '1', 'Nghĩa từ Việt của từ デザイン là:', 'tốt, đủ', 'lần', 'rán ngập', 'thiết kế', 'thiết kế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20531, 55, '1', 'Nghĩa từ Việt của từ バーゲンセール là:', 'suy nghĩ, cảm giác', 'xung quanh, vòng quanh', 'bằng cấp, tư cách', 'sale', 'sale');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20532, 55, '1', 'Nghĩa từ Việt của từ パート là:', 'làm thêm', 'chăm sóc', 'bị đâm', 'ghi lại', 'làm thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20533, 55, '1', 'Nghĩa từ Việt của từ コンビニエンスストア là:', 'xấu bụng', 'cửa hàng tiện ích', 'nông', 'điều hòa ấm', 'cửa hàng tiện ích');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20534, 55, '1', 'Nghĩa từ Việt của từ レジ là:', 'tráng miệng', 'được kết nối, được mở rộng, thông qua', 'trình độ, level', 'máy tính tiền', 'máy tính tiền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20535, 55, '1', 'Nghĩa từ Việt của từ レシート là:', 'được sử dụng', 'hóa đơn', 'gào to', 'phanh', 'hóa đơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20536, 55, '1', 'Nghĩa từ Việt của từ インスタント là:', 'giảm', 'ăn liền', 'tắc đường', 'mọc', 'ăn liền');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20537, 55, '1', 'Nghĩa từ Việt của từ ファストフード là:', 'phát minh', 'nhất định', 'đồ ăn nhanh', 'chuyên nghiệp', 'đồ ăn nhanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20538, 55, '1', 'Nghĩa từ Việt của từ フルーツ là:', 'đào tạo', 'trái cây', 'dựng lên', 'tóm, chộp', 'trái cây');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20539, 55, '1', 'Nghĩa từ Việt của từ デザート là:', 'bị giảm', 'thói quen', 'tội phạm', 'tráng miệng', 'tráng miệng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20540, 55, '1', 'Nghĩa từ Việt của từ インターネット là:', 'khởi đầu', 'tự tin', 'được quyết định', 'internet', 'internet');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20541, 55, '1', 'Nghĩa từ Việt của từ チャイム là:', 'tắc đường', 'chuông', 'thay đổi', 'tươi', 'chuông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20542, 55, '1', 'Nghĩa từ Việt của từ アナウンス là:', 'quen', 'chịu đựng giỏi', 'cổ vũ', 'thông báo', 'thông báo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20543, 55, '1', 'Nghĩa từ Việt của từ メッセージ là:', 'tin nhắn', 'giết', 'tự kiểm tra', 'có thể, được xây dựng', 'tin nhắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20544, 55, '1', 'Nghĩa từ Việt của từ パンフレット là:', 'hớn hở', 'làm hỏng', 'tờ rơi', 'khác', 'tờ rơi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20545, 55, '1', 'Nghĩa từ Việt của từ カード là:', 'thịnh vượng', 'card', 'xung quanh', 'chỉ', 'card');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20546, 55, '1', 'Nghĩa từ Việt của từ インタビュー là:', 'phỏng vấn', 'thực tế là', 'kiểu, thói', 'thần bí', 'phỏng vấn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20547, 55, '1', 'Nghĩa từ Việt của từ アンケート là:', 'phát triển', 'tờ câu hỏi', 'xuất hiện, được thẻ hiện', 'giới thiệu, gợi ý', 'tờ câu hỏi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20548, 55, '1', 'Nghĩa từ Việt của từ データ là:', 'giảm', 'dữ liệu', 'nhóm', 'tốt lên', 'dữ liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20549, 55, '1', 'Nghĩa từ Việt của từ パーセント là:', 'gần, sát nút', 'thấp nhất', 'đại thể, thường', 'phần trăm', 'phần trăm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20550, 55, '1', 'Nghĩa từ Việt của từ 濃い là:', 'làm vỡ', 'quan tâm, thông cảm', 'đậm, đặc', 'chiều cao', 'đậm, đặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20551, 55, '1', 'Nghĩa từ Việt của từ 薄い là:', 'thân thiết', 'điều tra', 'mỏng, nhạt', 'cháy', 'mỏng, nhạt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20552, 55, '1', 'Nghĩa từ Việt của từ 酸っぱい là:', 'ăn liền', 'chua', 'vượt, lướt', 'rõ ràng', 'chua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20553, 55, '1', 'Nghĩa từ Việt của từ 臭い là:', 'thông tin', 'bị giảm', 'thối', 'ngủ', 'thối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20554, 55, '1', 'Nghĩa từ Việt của từ おかしい là:', 'xổ số, rút thăm', 'trình độ, level', 'lạ', 'cháy', 'lạ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20555, 55, '1', 'Nghĩa từ Việt của từ かっこいい là:', 'bảnh bao', 'nắm chặt', 'người trưởng thành', 'tốt lên', 'bảnh bao');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20556, 55, '1', 'Nghĩa từ Việt của từ うまい là:', 'đánh thức', '(không) tí gì', 'ngon', 'tốt, đủ', 'ngon');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20557, 55, '1', 'Nghĩa từ Việt của từ 親しい là:', 'truyền đi, giới thiệu', 'cảm thấy', 'chuyển', 'thân thiết', 'thân thiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20558, 55, '1', 'Nghĩa từ Việt của từ 詳しい là:', 'thiết kế', 'đi làm', 'đồng phục', 'chi tiết', 'chi tiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20559, 55, '1', 'Nghĩa từ Việt của từ 細かい là:', 'tiết kiệm', 'tiểu tiết, bé', 'suốt đời', 'mang đến gần', 'tiểu tiết, bé');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20560, 55, '1', 'Nghĩa từ Việt của từ 浅い là:', 'đặc trưng', 'nông', 'điều tra', 'quốc tế', 'nông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20561, 55, '1', 'Nghĩa từ Việt của từ 固い・硬い là:', 'hoàn thành', 'dần dần', 'cứng', 'chôn', 'cứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20562, 55, '1', 'Nghĩa từ Việt của từ ぬるい là:', 'nguội', 'nhãn hiệu', 'nhóm', 'tránh xa', 'nguội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20563, 55, '1', 'Nghĩa từ Việt của từ まぶしい là:', 'sống', 'chói', 'mọc', 'trung bình', 'chói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20564, 55, '1', 'Nghĩa từ Việt của từ 蒸し暑い là:', 'da', 'thức dậy', 'đồng ý', 'nóng ẩm', 'nóng ẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20565, 55, '1', 'Nghĩa từ Việt của từ 清潔な là:', 'bỏ học', 'hơn nữa', 'sạch', 'tiêu đề', 'sạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20566, 55, '1', 'Nghĩa từ Việt của từ 新鮮な là:', 'tươi', 'xuất hiện, được thẻ hiện', 'hồi phục', 'tận hưởng', 'tươi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20567, 55, '1', 'Nghĩa từ Việt của từ 豊かな là:', 'buồn bã', 'lạ', 'giàu có', 'đồng phục', 'giàu có');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20568, 55, '1', 'Nghĩa từ Việt của từ 立派な là:', 'cảm thấy', 'dũng cảm, dũng khí', 'siêu', 'yêu', 'siêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20569, 55, '1', 'Nghĩa từ Việt của từ 正確な là:', 'chính xác', 'vô ý, buột', 'hậu bối', 'bị gãy', 'chính xác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20570, 55, '1', 'Nghĩa từ Việt của từ 確かな là:', 'giải quyết, nóng chảy', 'đích thực', 'suốt đời', 'đồng ý', 'đích thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20571, 55, '1', 'Nghĩa từ Việt của từ 重要な là:', 'quan trọng', 'bị đánh', 'có lẽ', 'thứ tự', 'quan trọng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20572, 55, '1', 'Nghĩa từ Việt của từ 必要な là:', 'được giao đến', 'cần thiết', 'quê quán', 'dịch', 'cần thiết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20573, 55, '1', 'Nghĩa từ Việt của từ もったいない là:', 'khát', 'lãng phí', 'tính cách', 'hoạt động', 'lãng phí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20574, 55, '1', 'Nghĩa từ Việt của từ すごい là:', 'kết nối, làm chặt thêm', 'ghê, siêu', 'về nhà', 'đặt hàng', 'ghê, siêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20575, 55, '1', 'Nghĩa từ Việt của từ ひどい là:', 'nuôi(râu)', 'tồi', 'hạnh phúc', 'loại', 'tồi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20576, 55, '1', 'Nghĩa từ Việt của từ 激しい là:', 'mở thêm, mở rộng, nới rộng, mở ra', 'mãnh liệt', 'biểu thị, biểu lộ, đại diện', 'yêu cầu', 'mãnh liệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20577, 55, '1', 'Nghĩa từ Việt của từ そっくりな là:', 'giống', 'phỏng vấn', 'được sửa', 'quấn, quàng', 'giống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20578, 55, '1', 'Nghĩa từ Việt của từ 急な là:', 'quê quán', 'tôn giáo', 'đột nhiên', 'đạt được, có được', 'đột nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20579, 55, '1', 'Nghĩa từ Việt của từ 敵とな là:', 'cháy', 'phù hợp', 'vừa vặn, đúng', 'thông dịch', 'phù hợp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20580, 55, '1', 'Nghĩa từ Việt của từ 特別な là:', 'tươi', 'sống', 'đặc biệt', 'sau cùng, cuối cùng, sau tất cả', 'đặc biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20581, 55, '1', 'Nghĩa từ Việt của từ 完全な là:', 'toàn bộ', 'thực tế là', 'che giấu', 'biểu thị, biểu lộ, đại diện', 'toàn bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20582, 55, '1', 'Nghĩa từ Việt của từ 盛んな là:', 'thịnh vượng', 'lặp lại', 'được tích tụ', 'cao lên', 'thịnh vượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20583, 55, '1', 'Nghĩa từ Việt của từ 様々な là:', 'lãnh đạo', 'tóm, chộp', 'đa đạng', 'giết', 'đa đạng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20584, 55, '1', 'Nghĩa từ Việt của từ 可能な là:', 'dựng lên', 'khả thi', 'nói chuyện riêng', 'điều kiện', 'khả thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20585, 55, '1', 'Nghĩa từ Việt của từ 不可能な là:', 'toàn bộ', 'bất khả thi', 'nhãn', 'được sinh ra', 'bất khả thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20586, 55, '1', 'Nghĩa từ Việt của từ 基本的な là:', 'leo lên', 'cơ bản', 'xấu bụng', 'lo lắng', 'cơ bản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20587, 55, '1', 'Nghĩa từ Việt của từ 国際的な là:', 'tình nguyện', 'nghĩ về', 'tiến lên', 'tính quốc tế', 'tính quốc tế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20588, 55, '1', 'Nghĩa từ Việt của từ ばらばらな là:', 'tung tóe, chia rẽ', 'máy tính tiền', 'làm tăng lên', 'sự kiện', 'tung tóe, chia rẽ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20589, 55, '1', 'Nghĩa từ Việt của từ ぼろぼろな là:', 'rách nát, te tua', 'được chuyển', 'đi làm, học', 'gián đoạn', 'rách nát, te tua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20590, 55, '1', 'Nghĩa từ Việt của từ 大変に là:', 'tham gia', 'giảm', 'khủng khiếp, rất nhiều', 'tráng miệng', 'khủng khiếp, rất nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20591, 55, '1', 'Nghĩa từ Việt của từ ほとんど là:', 'người được nói đến', 'gần như hoàn toàn', 'loại', 'làm mạnh lên', 'gần như hoàn toàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20592, 55, '1', 'Nghĩa từ Việt của từ 大体 là:', 'cầu, khấn', 'tình nguyện', 'bảo vệ', 'phần lớn, trong khoảng', 'phần lớn, trong khoảng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20593, 55, '1', 'Nghĩa từ Việt của từ かなり là:', 'bạn bè', 'khá', 'được quyết định', 'thực tế là', 'khá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20594, 55, '1', 'Nghĩa từ Việt của từ ずいぶん là:', 'khẩn cấp, vội', 'đáng kể', 'cho vào, cho lên, công bố', 'tiền bối', 'đáng kể');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20595, 55, '1', 'Nghĩa từ Việt của từ けっこう là:', 'trung thực', 'băn khoăn', 'rất', 'tiền bối', 'rất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20596, 55, '1', 'Nghĩa từ Việt của từ 大分 là:', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chủ yếu, khá', 'đại thể, thường', 'tồi', 'chủ yếu, khá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20597, 55, '1', 'Nghĩa từ Việt của từ もっと là:', 'giá cả, vật giá', 'hơn, nữa', 'gửi', 'bầu cử', 'hơn, nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20598, 55, '1', 'Nghĩa từ Việt của từ しっかり là:', 'giả', 'chính xác', 'thành phố', 'toàn bộ', 'toàn bộ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20599, 55, '1', 'Nghĩa từ Việt của từ いっぱい là:', 'đầy', 'lẫn nhau', 'vào đại học', 'mẫu', 'đầy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20600, 56, '1', 'Nghĩa từ Việt của từ ぎりぎり là:', 'hiện tại', 'gần, sát nút', 'tiền bối', 'không ngờ đến', 'gần, sát nút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20601, 56, '1', 'Nghĩa từ Việt của từ ぴったり là:', 'mang đến gần', 'yêu cầu', 'vừa vặn, đúng', 'truyền đi, giới thiệu', 'vừa vặn, đúng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20602, 56, '1', 'Nghĩa từ Việt của từ たいてい là:', 'kinh doanh, buôn bán', 'đại thể, thường', 'hoàn thành', 'trạng thái', 'đại thể, thường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20603, 56, '1', 'Nghĩa từ Việt của từ 同時に là:', 'cùng lúc', 'khởi đầu', 'phỏng vấn', 'đồng phục', 'cùng lúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20604, 56, '1', 'Nghĩa từ Việt của từ 前もって là:', 'giới thiệu, gợi ý', 'bên trong', 'trước', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'trước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20605, 56, '1', 'Nghĩa từ Việt của từ すぐに là:', 'bị chôn', 'cháy', 'lừa', 'ngay lập tức', 'ngay lập tức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20606, 56, '1', 'Nghĩa từ Việt của từ もうすぐ là:', 'nổi tiếng', 'làm cho tiến lên', 'sắp', 'giống', 'sắp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20607, 56, '1', 'Nghĩa từ Việt của từ 突然 là:', 'trước', 'chiến tranh', 'chính xác', 'đột nhiên', 'đột nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20608, 56, '1', 'Nghĩa từ Việt của từ あっという間に là:', 'sau cùng, cuối cùng, sau tất cả', 'loáng một cái', 'điều tra', 'bảo vệ', 'loáng một cái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20609, 56, '1', 'Nghĩa từ Việt của từ いつの間にか là:', 'lúc nào không biết', 'đông đúc', 'lo lắng', 'người trưởng thành', 'lúc nào không biết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20610, 56, '1', 'Nghĩa từ Việt của từ しばらく là:', 'thiệt hại', 'một chút', 'hiện tại', 'tự kiểm tra', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20611, 56, '1', 'Nghĩa từ Việt của từ ずっと là:', 'suốt, nhiều', 'bầu cử', 'lãnh đạo', 'thử thách', 'suốt, nhiều');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20612, 56, '1', 'Nghĩa từ Việt của từ 相変わらず là:', 'làm thêm', 'mọc', 'không bao giờ', 'như mọi khi', 'như mọi khi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20613, 56, '1', 'Nghĩa từ Việt của từ 次々に là:', 'nổi tiếng', 'bị ướt', 'lần lượt', 'quen', 'lần lượt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20614, 56, '1', 'Nghĩa từ Việt của từ どんどん là:', 'cố hương', 'tự tin', 'dần dần', 'cao nhất', 'dần dần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20615, 56, '1', 'Nghĩa từ Việt của từ ますます là:', 'càng ngày càng', 'truyền đi, giới thiệu', 'thăm', 'xung quanh, vòng quanh', 'càng ngày càng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20616, 56, '1', 'Nghĩa từ Việt của từ やっと là:', 'cấm', 'tiết kiệm', 'bầu cử', 'cuối cùng, vừa đủ', 'cuối cùng, vừa đủ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20617, 56, '1', 'Nghĩa từ Việt của từ とうとう là:', 'sau cùng, cuối cùng, sau tất cả', 'khát', 'xung quanh, vòng quanh', 'mang đến gần', 'sau cùng, cuối cùng, sau tất cả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20618, 56, '1', 'Nghĩa từ Việt của từ ついに là:', 'thất nghiệp', 'tổ chức', 'sở thích', 'cuối cùng, sau cùng', 'cuối cùng, sau cùng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20619, 56, '1', 'Nghĩa từ Việt của từ もちろん là:', 'tất nhiên', 'thành công', 'luật lệ', 'kịp giờ', 'tất nhiên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20620, 56, '1', 'Nghĩa từ Việt của từ やはり là:', 'gào to', 'như dự tính', 'chán', 'đại thể, thường', 'như dự tính');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20621, 56, '1', 'Nghĩa từ Việt của từ きっと là:', 'về quê', 'suốt đời', 'thông tin', 'nhất định', 'nhất định');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20622, 56, '1', 'Nghĩa từ Việt của từ ぜひ là:', 'bằng mọi giá, rất (muốn)', 'chán', 'nghĩ, ý tưởng', 'hớn hở', 'bằng mọi giá, rất (muốn)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20623, 56, '1', 'Nghĩa từ Việt của từ なるべく là:', 'càng nhiều càng tốt', 'cảm động', 'tiền lẻ', 'về nhà', 'càng nhiều càng tốt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20624, 56, '1', 'Nghĩa từ Việt của từ 案外 là:', 'mất', 'nhựa', 'không ngờ đến', 'tiết kiệm', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20625, 56, '1', 'Nghĩa từ Việt của từ もしかすると・もしかしたら・もしかして là:', 'có lẽ', 'rán ngập', 'chán', 'quan tâm, thông cảm', 'có lẽ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20626, 56, '1', 'Nghĩa từ Việt của từ まさか là:', 'hỏng', 'không thể ngờ, không', 'băn khoăn', 'truyền đi, giới thiệu', 'không thể ngờ, không');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20627, 56, '1', 'Nghĩa từ Việt của từ うっかり là:', 'trưởng thành', 'ngơ ngác, không để ý', 'phanh', 'mãnh liệt', 'ngơ ngác, không để ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20628, 56, '1', 'Nghĩa từ Việt của từ つい là:', 'phát triển', 'vô ý, buột', 'bị tàn, rụng', 'kết thúc', 'vô ý, buột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20629, 56, '1', 'Nghĩa từ Việt của từ 思わず là:', 'tiếp tục, xảy ra, lặp lại, theo sau', 'không ngờ đến', 'thông tin', 'thử thách', 'không ngờ đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20630, 56, '1', 'Nghĩa từ Việt của từ ほっと là:', 'chiều cao', 'yên tâm', 'chăm sóc', 'phương đông', 'yên tâm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20631, 56, '1', 'Nghĩa từ Việt của từ いらいら là:', 'đăng ký', 'tiền bối', 'khó chịu, nóng giận', 'kết nối, làm chặt thêm', 'khó chịu, nóng giận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20632, 56, '1', 'Nghĩa từ Việt của từ のんびり là:', 'nổi tiếng', 'đường tắt', 'thực tế là', 'tận hưởng', 'tận hưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20633, 56, '1', 'Nghĩa từ Việt của từ 実は là:', 'được kết nối, được mở rộng, thông qua', 'thực tế là', 'được xây', 'lẫn nhau', 'thực tế là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20634, 56, '1', 'Nghĩa từ Việt của từ 読書 là:', 'đọc viết', 'trái cây', 'đạt được, có được', 'xung quanh, vòng quanh', 'đọc viết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20635, 56, '1', 'Nghĩa từ Việt của từ 演奏 là:', 'biểu diễn', 'lấy cắp', 'tắc đường', 'tình nguyện', 'biểu diễn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20636, 56, '1', 'Nghĩa từ Việt của từ 芸術 là:', 'nghệ thuật', 'nuôi(râu)', 'chịu đựng giỏi', 'đun sôi', 'nghệ thuật');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20637, 56, '1', 'Nghĩa từ Việt của từ 検査 là:', 'kiểm tra', 'thông tin', 'đùa cợt', 'làm cho tiến lên', 'kiểm tra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20638, 56, '1', 'Nghĩa từ Việt của từ 血液 là:', 'chăm sóc', 'nuôi(râu)', 'máu', 'cho xuống', 'máu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20639, 56, '1', 'Nghĩa từ Việt của từ 治療 là:', 'lỗ', 'nuôi(râu)', 'bị thừa', 'trị liệu', 'trị liệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20640, 56, '1', 'Nghĩa từ Việt của từ 症状 là:', 'cảm thấy', 'người được nói đến', 'triệu chứng', 'hớn hở', 'triệu chứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20641, 56, '1', 'Nghĩa từ Việt của từ 予防 là:', 'dán', 'thăm', 'dự phòng', 'dũng cảm, dũng khí', 'dự phòng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20642, 56, '1', 'Nghĩa từ Việt của từ 栄養 là:', 'đăng ký', 'cảm tưởng', 'dinh dưỡng', 'nuôi(râu)', 'dinh dưỡng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20643, 56, '1', 'Nghĩa từ Việt của từ 手術 là:', 'phẫu thuật', 'lừa', 'thay đổi, biến hóa', 'thay đổi', 'phẫu thuật');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20644, 56, '1', 'Nghĩa từ Việt của từ 死亡 là:', 'bị bẩn', 'tóm, chộp', 'làm tăng lên', 'tử vong', 'tử vong');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20645, 56, '1', 'Nghĩa từ Việt của từ 命 là:', 'khởi đầu', 'sở thích', 'sinh mạng', 'rất', 'sinh mạng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20646, 56, '1', 'Nghĩa từ Việt của từ 一生 là:', '(không) tí gì', 'suốt đời', 'lo lắng', 'sống', 'suốt đời');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20647, 56, '1', 'Nghĩa từ Việt của từ 誤解 là:', 'dựng lên', 'hiểu nhầm', 'tiết kiệm', 'chung', 'hiểu nhầm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20648, 56, '1', 'Nghĩa từ Việt của từ 後悔 là:', 'hối hận', 'đánh thức', 'vừa, được công bố', 'cấm hút thuốc', 'hối hận');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20649, 56, '1', 'Nghĩa từ Việt của từ 訳 là:', 'thức xuyên đêm', 'lý do', 'băn khoăn', 'giữ', 'lý do');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20650, 56, '1', 'Nghĩa từ Việt của từ 態度 là:', 'khởi đầu', 'da', 'thái độ', 'vô lý', 'thái độ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20651, 56, '1', 'Nghĩa từ Việt của từ 癖 là:', 'hớn hở', 'tôn giáo', 'giao đến', 'thói quen', 'thói quen');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20652, 56, '1', 'Nghĩa từ Việt của từ 礼儀 là:', 'bao gồm', 'yêu cầu', 'kết thúc', 'lễ nghĩa', 'lễ nghĩa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20653, 56, '1', 'Nghĩa từ Việt của từ 文句 là:', 'cấm', '(không) tí gì', 'bầu cử', 'phàn nàn', 'phàn nàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20654, 56, '1', 'Nghĩa từ Việt của từ 表情 là:', 'biểu lộ, biểu thị', 'xung quanh', 'được trả lại', 'thiết kế', 'biểu lộ, biểu thị');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20655, 56, '1', 'Nghĩa từ Việt của từ 鏡面 là:', 'thiếu', 'tính cách', 'đối lập', 'bề mặt', 'bề mặt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20656, 56, '1', 'Nghĩa từ Việt của từ 禁煙 là:', 'dọn dẹp', 'cháy', 'cấm hút thuốc', 'chán', 'cấm hút thuốc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20657, 56, '1', 'Nghĩa từ Việt của từ 禁止 là:', 'điều hòa ấm', 'tờ rơi', 'ngay ngắn', 'cấm', 'cấm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20658, 56, '1', 'Nghĩa từ Việt của từ 完成 là:', 'luật lệ', 'phương tây', 'ăn liền', 'hoàn thành', 'hoàn thành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20659, 56, '1', 'Nghĩa từ Việt của từ 課題 là:', 'lo lắng', 'bị gãy', 'cắt, hết hạn', 'chủ đề', 'chủ đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20660, 56, '1', 'Nghĩa từ Việt của từ 例外 là:', 'ngoại lệ', 'bị gãy', 'bất an', 'chủ yếu, khá', 'ngoại lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20661, 56, '1', 'Nghĩa từ Việt của từ 基本 là:', 'đoàn thể', 'cơ bản', 'tính chất', 'hội, tiệc', 'cơ bản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20662, 56, '1', 'Nghĩa từ Việt của từ 記録 là:', 'xung quanh, vòng quanh', 'ghi âm', 'đóng gói', 'quan hệ', 'ghi âm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20663, 56, '1', 'Nghĩa từ Việt của từ 状態 là:', 'trạng thái', 'thử', 'bầu cử', 'làm cho tiến lên', 'trạng thái');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20664, 56, '1', 'Nghĩa từ Việt của từ 出来事 là:', 'chụp', 'so sánh', 'sự kiện', 'hớn hở', 'sự kiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20665, 56, '1', 'Nghĩa từ Việt của từ 場面 là:', 'tội phạm', 'kết nối, làm chặt thêm', 'khung cảnh, tình huống, hiện trường', 'đại thể, thường', 'khung cảnh, tình huống, hiện trường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20666, 56, '1', 'Nghĩa từ Việt của từ 機会 là:', 'nhảy', 'top', 'hoàn tất', 'cơ hội', 'cơ hội');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20667, 56, '1', 'Nghĩa từ Việt của từ 距離 là:', 'phụ nữ', 'lẫn nhau', 'khởi động', 'khoảng cách', 'khoảng cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20668, 56, '1', 'Nghĩa từ Việt của từ 提案 là:', 'nhảy', 'đề xuất', 'kiến thức', 'có hiệu quả', 'đề xuất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20669, 56, '1', 'Nghĩa từ Việt của từ やり取り là:', 'gần như hoàn toàn', 'bị giảm', 'trao đổi, làm việc', 'đại thể, thường', 'trao đổi, làm việc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20670, 56, '1', 'Nghĩa từ Việt của từ 知識 là:', 'giúp đỡ', 'nhãn', 'kinh doanh, buôn bán', 'kiến thức', 'kiến thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20671, 56, '1', 'Nghĩa từ Việt của từ 実力 là:', 'thực lực', 'dựng lên', 'xung quanh, vòng quanh', 'sống', 'thực lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20672, 56, '1', 'Nghĩa từ Việt của từ 手段 là:', 'được sử dụng', 'cách thức', 'tin tức, thông báo', 'thế nào, bao nhiêu', 'cách thức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20673, 56, '1', 'Nghĩa từ Việt của từ 代表 là:', 'giá cả, vật giá', 'giao đến', 'xuất hiện, hiện ra', 'đại biểu', 'đại biểu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20674, 56, '1', 'Nghĩa từ Việt của từ 影響 là:', 'sâu hơn', 'mất', 'ảnh hưởng', 'mở thêm, mở rộng, nới rộng, mở ra', 'ảnh hưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20675, 56, '1', 'Nghĩa từ Việt của từ 効果 là:', 'đường tắt', 'trực tiếp', 'hiệu quả', 'làm yếu đi', 'hiệu quả');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20676, 56, '1', 'Nghĩa từ Việt của từ 印象 là:', 'hòa bình', 'ấn tượng', 'vô lý', 'gào to', 'ấn tượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20677, 56, '1', 'Nghĩa từ Việt của từ 印 là:', 'dấu, dấu hiệu', 'thấp nhất', 'sống', 'tiêu đề', 'dấu, dấu hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20678, 56, '1', 'Nghĩa từ Việt của từ 合図 là:', 'tốt lên', 'bị lạnh', 'ám hiệu', 'ngủ', 'ám hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20679, 56, '1', 'Nghĩa từ Việt của từ 共通 là:', 'nhóm', 'tội phạm', 'tự kiểm tra', 'chung', 'chung');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20680, 56, '1', 'Nghĩa từ Việt của từ 協調 là:', 'hoàn thành', 'nhấn mạnh', 'điều hòa ấm', 'thực hành', 'nhấn mạnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20681, 56, '1', 'Nghĩa từ Việt của từ 省略 là:', 'đoàn thể', 'giải quyết', 'cổ vũ', 'lược bớt', 'lược bớt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20682, 56, '1', 'Nghĩa từ Việt của từ 挑戦 là:', 'sâu hơn', 'đồng phục', 'đùa cợt', 'thử thách', 'thử thách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20683, 56, '1', 'Nghĩa từ Việt của từ やる気 là:', 'đồng phục', 'bị tràn', 'điều hòa ấm', 'động lực', 'động lực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20684, 56, '1', 'Nghĩa từ Việt của từ 勇気 là:', 'lãng phí', 'người trưởng thành', 'dũng cảm, dũng khí', 'kết quả', 'dũng cảm, dũng khí');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20685, 56, '1', 'Nghĩa từ Việt của từ 資格 là:', 'quan trọng', 'trao, cung cấp', 'bị chôn', 'bằng cấp, tư cách', 'bằng cấp, tư cách');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20686, 56, '1', 'Nghĩa từ Việt của từ 申請 là:', 'trạng thái', 'hiểu, thông qua', 'bị bẩn', 'đăng ký, ứng tuyển', 'đăng ký, ứng tuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20687, 56, '1', 'Nghĩa từ Việt của từ 本人 là:', 'giảm', 'người được nói đến', 'bọc', 'cười', 'người được nói đến');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20688, 56, '1', 'Nghĩa từ Việt của từ 契約 là:', 'đón', 'bị giảm', 'hợp đồng', 'dọn dẹp', 'hợp đồng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20689, 56, '1', 'Nghĩa từ Việt của từ 証明 là:', 'chứng minh, bằng chứng', 'tôn giáo', 'tiến lên', 'tràn', 'chứng minh, bằng chứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20690, 56, '1', 'Nghĩa từ Việt của từ 変更 là:', 'mối quan hệ', 'tha thứ, cho phép', 'phát minh', 'thay đổi', 'thay đổi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20691, 56, '1', 'Nghĩa từ Việt của từ 保存 là:', 'bảo tồn', 'bị đâm', 'thông tin truyền thông', 'thân thiết', 'bảo tồn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20692, 56, '1', 'Nghĩa từ Việt của từ 保護 là:', 'tăng lên', 'phát kiến', 'giá cả, vật giá', 'bảo vệ', 'bảo vệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20693, 56, '1', 'Nghĩa từ Việt của từ 環境 là:', 'môi trường', 'quen', 'cuộc sống', 'cầu, khấn', 'môi trường');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20694, 56, '1', 'Nghĩa từ Việt của từ 資源 là:', 'bao gồm', 'kiểu gì cũng', 'kẹt xỉ', 'tài nguyên', 'tài nguyên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20695, 56, '1', 'Nghĩa từ Việt của từ 不足 là:', 'nuôi(râu)', 'thiếu', 'ghê, siêu', 'sôi', 'thiếu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20696, 56, '1', 'Nghĩa từ Việt của từ 平均 là:', 'nổi tiếng', 'phụ nữ', 'cảm thấy', 'trung bình', 'trung bình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20697, 56, '1', 'Nghĩa từ Việt của từ 割合 là:', 'tỷ lệ', 'đổ', 'tăng lên', 'phép cộng, tác động tích cực', 'tỷ lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20698, 56, '1', 'Nghĩa từ Việt của từ 商売 là:', 'chia', 'làm hỏng', 'dũng cảm, dũng khí', 'kinh doanh, buôn bán', 'kinh doanh, buôn bán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20699, 56, '1', 'Nghĩa từ Việt của từ 商品 là:', 'nhãn', 'người được nói đến', 'sản phẩm', 'làm tăng lên', 'sản phẩm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20700, 56, '1', 'Nghĩa từ Việt của từ 質 là:', 'quan tâm, thông cảm', 'lịch, kế hoạch', 'cảm thấy', 'chất lượng', 'chất lượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20701, 56, '1', 'Nghĩa từ Việt của từ 型 là:', 'lần lượt', 'thiết kế', 'hỏng', 'mẫu', 'mẫu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20702, 56, '1', 'Nghĩa từ Việt của từ 生産 là:', 'sản xuất', 'giữ', 'tài nguyên', 'nhớ lại', 'sản xuất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20703, 56, '1', 'Nghĩa từ Việt của từ 消費 là:', 'tiêu dùng, tiêu thụ', 'tách ra', 'làm giảm xuống', 'vừa, được công bố', 'tiêu dùng, tiêu thụ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20704, 56, '1', 'Nghĩa từ Việt của từ 物価 là:', 'kết quả', 'chính xác', 'kết thúc', 'giá cả, vật giá', 'giá cả, vật giá');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20705, 56, '1', 'Nghĩa từ Việt của từ 倒産 là:', 'lớn lên, tăng thêm, dài ra', 'phá sản', 'đón', 'da', 'phá sản');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20706, 56, '1', 'Nghĩa từ Việt của từ 携帯 là:', 'cắt, hết hạn', 'tiến lên', 'đại thể, thường', 'mang theo', 'mang theo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20707, 56, '1', 'Nghĩa từ Việt của từ 現代 là:', 'hiện tại', 'qua', 'nấu', 'tội phạm', 'hiện tại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20708, 56, '1', 'Nghĩa từ Việt của từ 世紀 là:', 'như mọi khi', 'trung bình', 'thế kỷ', 'được bao phủ', 'thế kỷ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20709, 56, '1', 'Nghĩa từ Việt của từ 文化 là:', 'tờ rơi', 'văn hóa', 'top', 'trình độ, level', 'văn hóa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20710, 56, '1', 'Nghĩa từ Việt của từ 都市 là:', 'giải quyết', 'thành phố', 'tờ rơi', 'văn hóa', 'thành phố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20711, 56, '1', 'Nghĩa từ Việt của từ 地方 là:', 'xung quanh', 'quảng cáo', 'địa phương', 'tổ chức', 'địa phương');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20712, 56, '1', 'Nghĩa từ Việt của từ 戦争 là:', 'đối lập', 'nói chuyện riêng', 'mất', 'chiến tranh', 'chiến tranh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20713, 56, '1', 'Nghĩa từ Việt của từ 平和 là:', 'xung quanh', 'bị lột', 'dọn dẹp', 'hòa bình', 'hòa bình');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20714, 56, '1', 'Nghĩa từ Việt của từ 上る là:', 'đặc biệt là', 'leo lên', 'bầu cử', 'đàn ông', 'leo lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20715, 56, '1', 'Nghĩa từ Việt của từ 下る là:', 'hoàn thành', 'ngại ngần', 'đi xuống', 'robot', 'đi xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20716, 56, '1', 'Nghĩa từ Việt của từ 進む là:', 'tiến lên', 'sắp', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'tóm, chộp', 'tiến lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20717, 56, '1', 'Nghĩa từ Việt của từ 進める là:', 'xuất hiện, được thẻ hiện', 'bị sai', 'mặt trời', 'làm cho tiến lên', 'làm cho tiến lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20718, 56, '1', 'Nghĩa từ Việt của từ 通る là:', 'đăng ký', 'nữa', 'thông qua, được chấp nhận, đi qua', 'bầu cử', 'thông qua, được chấp nhận, đi qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20719, 56, '1', 'Nghĩa từ Việt của từ 通す là:', 'xuyên qua, thông qua', 'nhãn', 'cần thiết', 'trạng thái', 'xuyên qua, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20720, 57, '1', 'Nghĩa từ Việt của từ 超える・越える là:', 'thuê', 'tự động', 'vượt qua', 'thoải mái', 'vượt qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20721, 57, '1', 'Nghĩa từ Việt của từ 過ぎる là:', 'quá, đi qua', 'cúi chào', 'đăng ký', 'bắt', 'quá, đi qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20722, 57, '1', 'Nghĩa từ Việt của từ 過ごす là:', 'kiến thức', 'sử dụng(thời gian)', 'yên tâm', 'ngủ', 'sử dụng(thời gian)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20723, 57, '1', 'Nghĩa từ Việt của từ 移る là:', 'được chuyển', 'điều hòa ấm', 'nhảy', 'phát kiến', 'được chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20724, 57, '1', 'Nghĩa từ Việt của từ 移す là:', 'rán ngập', 'đại thể, thường', 'chuyển', 'nguyên nhân', 'chuyển');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20725, 57, '1', 'Nghĩa từ Việt của từ 連れる là:', 'khỏe khoắn', 'dẫn đi', 'tình nguyện', 'tính chất', 'dẫn đi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20726, 57, '1', 'Nghĩa từ Việt của từ 寄る là:', 'phát kiến', 'lần lượt, tương ứng', 'đùa cợt', 'ghé sát, lại gần', 'ghé sát, lại gần');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20727, 57, '1', 'Nghĩa từ Việt của từ 寄せる là:', 'ngại ngần', 'ghé vào', 'tính cách', 'hàng', 'ghé vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20728, 57, '1', 'Nghĩa từ Việt của từ 与える là:', 'xung quanh, vòng quanh', 'chủ yếu, khá', 'trao, cung cấp', 'được dạy', 'trao, cung cấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20729, 57, '1', 'Nghĩa từ Việt của từ 得る là:', 'vượt, lướt', 'đạt được, có được', 'dđóng', 'tăng giá', 'đạt được, có được');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20730, 57, '1', 'Nghĩa từ Việt của từ 向く là:', 'hướng, đối diện', 'trạng thái', 'xấu bụng', 'tội phạm', 'hướng, đối diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20731, 57, '1', 'Nghĩa từ Việt của từ 向ける là:', 'hướng đến, quay', 'nuôi(râu)', 'bị giảm', 'được thống nhất, được tổ chức, được sắp xếp', 'hướng đến, quay');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20732, 57, '1', 'Nghĩa từ Việt của từ 勧める là:', 'rủ, mời, gợi ý', 'cuộc sống', 'tự động', 'nhãn hiệu', 'rủ, mời, gợi ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20733, 57, '1', 'Nghĩa từ Việt của từ 薦める là:', 'được bao phủ', 'nghỉ việc', 'giới thiệu, gợi ý', 'bầu cử', 'giới thiệu, gợi ý');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20734, 57, '1', 'Nghĩa từ Việt của từ 任せる là:', 'giảm xuống', 'tin tưởng, để cho ai đó làm gì', 'làm cho tiến lên', 'làm bẩn', 'tin tưởng, để cho ai đó làm gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20735, 57, '1', 'Nghĩa từ Việt của từ 守る là:', 'sâu hơn', 'giữ, tuân thủ, bảo vệ', 'phát minh', 'tình nguyện', 'giữ, tuân thủ, bảo vệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20736, 57, '1', 'Nghĩa từ Việt của từ 争う là:', 'trái đất', 'gây gổ, tranh giành', 'đóng gói', 'cúi chào', 'gây gổ, tranh giành');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20737, 57, '1', 'Nghĩa từ Việt của từ 臨む là:', 'thuê', 'ước', 'buồn bã', 'kiên quyết, chắc chắn, đáng tin cậy', 'ước');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20738, 57, '1', 'Nghĩa từ Việt của từ 信じる là:', 'quan tâm, thông cảm', 'khác', 'xuất hiện, được thẻ hiện', 'tin tưởng', 'tin tưởng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20739, 57, '1', 'Nghĩa từ Việt của từ 通じる là:', 'nhóm', 'buồn bã', 'làm rộng ra', 'hiểu, thông qua', 'hiểu, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20740, 57, '1', 'Nghĩa từ Việt của từ 飽きる là:', 'thịnh vượng', 'chán, ngấy', 'hòa bình', 'bị giảm', 'chán, ngấy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20741, 57, '1', 'Nghĩa từ Việt của từ 思いつく là:', 'điều hòa ấm', 'chính xác', 'điều hòa ấm', 'nghĩ về', 'nghĩ về');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20742, 57, '1', 'Nghĩa từ Việt của từ 思いやる là:', 'khác', 'giao vào, lẫn vào', 'thân thiết', 'quan tâm, thông cảm', 'quan tâm, thông cảm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20743, 57, '1', 'Nghĩa từ Việt của từ 熱中する là:', 'nghiện', 'giải quyết', 'văn hóa', 'chi tiết', 'nghiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20744, 57, '1', 'Nghĩa từ Việt của từ 暮らす là:', 'đánh thức', 'tiết kiệm', 'sống', 'sản phẩm', 'sống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20745, 57, '1', 'Nghĩa từ Việt của từ 巻く là:', 'tính chất', 'cắt, hết hạn', 'cho chảy', 'quấn, quàng', 'quấn, quàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20746, 57, '1', 'Nghĩa từ Việt của từ 結ぶ là:', 'buộc, cột, nối', 'cấm', 'điều hòa ấm', 'trái đất', 'buộc, cột, nối');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20747, 57, '1', 'Nghĩa từ Việt của từ 済む là:', 'kết thúc', 'hóa đơn', 'ngại ngần', 'cuộc sống', 'kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20748, 57, '1', 'Nghĩa từ Việt của từ 済ませる・済ます là:', 'hoàn tất', 'giả', 'dần dần', 'ghê, siêu', 'hoàn tất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20749, 57, '1', 'Nghĩa từ Việt của từ 出来る là:', 'mời, rủ', 'có thể, được xây dựng', 'làm lạnh', 'hòa bình', 'có thể, được xây dựng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20750, 57, '1', 'Nghĩa từ Việt của từ 切れる là:', 'bị giảm', 'không thể ngờ, không', 'cắt, hết hạn', 'làm cho tiến lên', 'cắt, hết hạn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20751, 57, '1', 'Nghĩa từ Việt của từ 切らす là:', 'hết', 'làm rộng ra', 'lượt', 'làm tăng lên', 'hết');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20752, 57, '1', 'Nghĩa từ Việt của từ 伝わる là:', 'được truyền đi, được trải ra, được giới thiệu', 'thoải mái', 'hỏng', 'đông đúc', 'được truyền đi, được trải ra, được giới thiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20753, 57, '1', 'Nghĩa từ Việt của từ 伝える là:', 'truyền đi, giới thiệu', 'kiểu, thói', 'đoàn thể', 'đặc biệt là', 'truyền đi, giới thiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20754, 57, '1', 'Nghĩa từ Việt của từ 続く là:', 'tiếp tục, xảy ra, lặp lại, theo sau', 'khẩn cấp, vội', 'kiến thức', 'hớn hở', 'tiếp tục, xảy ra, lặp lại, theo sau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20755, 57, '1', 'Nghĩa từ Việt của từ 続ける là:', 'quê quán', 'nuôi(râu)', 'tiếp tục, xảy ra liên tiếp', 'bên trong', 'tiếp tục, xảy ra liên tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20756, 57, '1', 'Nghĩa từ Việt của từ つながる là:', 'bề trên', 'máu', 'được kết nối, được mở rộng, thông qua', 'kiên quyết, chắc chắn, đáng tin cậy', 'được kết nối, được mở rộng, thông qua');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20757, 57, '1', 'Nghĩa từ Việt của từ つなぐ là:', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'thế thì', 'tràn', 'kết nối, tham gia', 'kết nối, tham gia');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20758, 57, '1', 'Nghĩa từ Việt của từ つなげる là:', 'tham quan', 'khát', 'kết nối, làm chặt thêm', 'nghiện', 'kết nối, làm chặt thêm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20759, 57, '1', 'Nghĩa từ Việt của từ 伸びる là:', 'cài đặt, set', 'được dạy', 'lớn lên, tăng thêm, dài ra', 'nhóm', 'lớn lên, tăng thêm, dài ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20760, 57, '1', 'Nghĩa từ Việt của từ 伸ばす là:', 'tươi', 'nghỉ việc', 'cầu, khấn', 'nuôi dài, căng ra', 'nuôi dài, căng ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20761, 57, '1', 'Nghĩa từ Việt của từ 延びる là:', 'khởi động', 'bị trì hoãn, bị kéo dài', 'rán ngập', 'thoải mái', 'bị trì hoãn, bị kéo dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20762, 57, '1', 'Nghĩa từ Việt của từ 延ばす là:', 'cháy', 'yêu cầu', 'trì hoãn, kéo dài', 'cháy', 'trì hoãn, kéo dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20763, 57, '1', 'Nghĩa từ Việt của từ 重なる là:', 'tiết kiệm', 'bao gồm', 'đào tạo', 'xung đột, xếp chồng', 'xung đột, xếp chồng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20764, 57, '1', 'Nghĩa từ Việt của từ 重ねる là:', 'top', 'chồng lên, tích trữ', 'thể lực', 'thời gian, thời kỳ', 'chồng lên, tích trữ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20765, 57, '1', 'Nghĩa từ Việt của từ 広がる là:', 'mở rộng, bùng phát, lan tràn, trải dài', 'sở thích', 'nổi tiếng', 'năng lượng', 'mở rộng, bùng phát, lan tràn, trải dài');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20766, 57, '1', 'Nghĩa từ Việt của từ 広げる là:', 'ghê, siêu', 'truyền đi, giới thiệu', 'mở thêm, mở rộng, nới rộng, mở ra', 'quê quán', 'mở thêm, mở rộng, nới rộng, mở ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20767, 57, '1', 'Nghĩa từ Việt của từ 載る là:', 'đáy', 'vừa, được công bố', 'danh thiếp', 'bị lạnh', 'vừa, được công bố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20768, 57, '1', 'Nghĩa từ Việt của từ 載せる là:', 'cho vào, cho lên, công bố', 'trị liệu', 'bọc', 'người trưởng thành', 'cho vào, cho lên, công bố');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20769, 57, '1', 'Nghĩa từ Việt của từ そろう là:', 'phát kiến', 'làm yếu đi', 'hòa bình', 'thu thập, được thu thập', 'thu thập, được thu thập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20770, 57, '1', 'Nghĩa từ Việt của từ そろえる là:', 'bao gồm', 'chịu đựng giỏi', 'mũ bảo hiểm', 'gom lại, chuẩn bị sẵn sàng', 'gom lại, chuẩn bị sẵn sàng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20771, 57, '1', 'Nghĩa từ Việt của từ まとまる là:', 'quê quán', 'lấy cắp', 'có lẽ', 'được thống nhất, được tổ chức, được sắp xếp', 'được thống nhất, được tổ chức, được sắp xếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20772, 57, '1', 'Nghĩa từ Việt của từ まとめる là:', 'chiều cao', 'được giao đến', 'tập hợp, sàng lọc, hợp nhất, tổ chức', 'gần như hoàn toàn', 'tập hợp, sàng lọc, hợp nhất, tổ chức');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20773, 57, '1', 'Nghĩa từ Việt của từ 付く là:', 'quê quán', 'làm gãy', 'dính, gắn, đạt được, đi cùng với', 'chán', 'dính, gắn, đạt được, đi cùng với');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20774, 57, '1', 'Nghĩa từ Việt của từ 付ける là:', 'gắn, thêm vào', 'thoải mái', 'ôm', 'yêu cầu', 'gắn, thêm vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20775, 57, '1', 'Nghĩa từ Việt của từ たまる là:', 'giúp đỡ', 'hòa bình', 'cảm tưởng', 'được tiết kiệm', 'được tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20776, 57, '1', 'Nghĩa từ Việt của từ ためる là:', 'thất nghiệp', 'đối tác', 'bị thừa', 'tiết kiệm', 'tiết kiệm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20777, 57, '1', 'Nghĩa từ Việt của từ 交じる・混じる là:', 'vào đại học', 'quan trọng', 'giao vào, lẫn vào', 'đông đúc', 'giao vào, lẫn vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20778, 57, '1', 'Nghĩa từ Việt của từ 交ざる・混ざる là:', 'phép cộng, tác động tích cực', 'được trộn lẫn', 'tiền lẻ', 'vừa vặn, đúng', 'được trộn lẫn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20779, 57, '1', 'Nghĩa từ Việt của từ 交ぜる・混ぜる là:', 'con dấu', 'không ngờ đến', 'lừa', 'trộn vào', 'trộn vào');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20780, 57, '1', 'Nghĩa từ Việt của từ 解ける・溶ける là:', 'được giải quyết, nóng chảy', 'tham quan', 'tham quan', 'làm cho kịp giờ', 'được giải quyết, nóng chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20781, 57, '1', 'Nghĩa từ Việt của từ 解く・溶く là:', 'che giấu', 'giải quyết, nóng chảy', 'thăm', 'mượn', 'giải quyết, nóng chảy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20782, 57, '1', 'Nghĩa từ Việt của từ 含む là:', 'chứa, bao gồm', 'yêu cầu', 'được bao phủ', 'thiết kế', 'chứa, bao gồm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20783, 57, '1', 'Nghĩa từ Việt của từ 含める là:', 'dựng lên', 'bao gồm', 'loại', 'nướng, nấu', 'bao gồm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20784, 57, '1', 'Nghĩa từ Việt của từ 抜ける là:', 'cấp trên', 'đào tạo', 'mặt trời', 'tháo, tuột', 'tháo, tuột');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20785, 57, '1', 'Nghĩa từ Việt của từ 抜く là:', 'văn hóa', 'được giao đến', 'lấy ra', 'nghỉ việc', 'lấy ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20786, 57, '1', 'Nghĩa từ Việt của từ 現れる là:', 'cấm', 'xuất hiện, được thẻ hiện', 'tiết kiệm', 'sở thích', 'xuất hiện, được thẻ hiện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20787, 57, '1', 'Nghĩa từ Việt của từ 現す là:', 'dựng lên', 'xuất hiện, hiện ra', 'trang trí', 'bị chôn', 'xuất hiện, hiện ra');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20788, 57, '1', 'Nghĩa từ Việt của từ 表れる là:', 'biểu hiện (trên mặt)', 'tách ra', 'hóa đơn', 'da', 'biểu hiện (trên mặt)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20789, 57, '1', 'Nghĩa từ Việt của từ 表す là:', 'biểu thị, biểu lộ, đại diện', 'bao gồm', 'cháy', 'cổ vũ', 'biểu thị, biểu lộ, đại diện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20790, 57, '1', 'Nghĩa từ Việt của từ 散る là:', 'khác', 'bị tàn, rụng', 'thuê', 'tham quan', 'bị tàn, rụng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20791, 57, '1', 'Nghĩa từ Việt của từ 散らす là:', 'tàn', 'hỗn tạp', 'được xây', 'mọc', 'tàn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20792, 57, '1', 'Nghĩa từ Việt của từ 明ける là:', 'trào lưu', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'giảm', 'thông tin', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20793, 57, '1', 'Nghĩa từ Việt của từ 差す là:', 'sau cùng, cuối cùng, sau tất cả', 'phát minh', 'tiến lên', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20794, 57, '1', 'Nghĩa từ Việt của từ パートナ là:', 'được nấu', 'đối tác', 'khởi đầu', 'giận dữ', 'đối tác');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20795, 57, '1', 'Nghĩa từ Việt của từ リーダー là:', 'tự do', 'lãnh đạo', 'giao đến', 'xung quanh, vòng quanh', 'lãnh đạo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20796, 57, '1', 'Nghĩa từ Việt của từ ボランティア là:', 'trung bình', 'giảm xuống', 'bất mãn', 'tình nguyện', 'tình nguyện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20797, 57, '1', 'Nghĩa từ Việt của từ コミュニケーション là:', 'nhóm', 'giao tiếp', 'suốt, nhiều', 'mời, rủ', 'giao tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20798, 57, '1', 'Nghĩa từ Việt của từ ユーモア là:', 'mất', 'cổ vũ', 'hài hước, đùa', 'giết', 'hài hước, đùa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20799, 57, '1', 'Nghĩa từ Việt của từ ショック là:', 'hòa bình', 'shock, choáng', 'điều hòa ấm', 'sơn', 'shock, choáng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20800, 57, '1', 'Nghĩa từ Việt của từ ストレス là:', 'phát triển', 'nuôi(râu)', 'căng thẳng, stress', 'phát kiến', 'căng thẳng, stress');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20801, 57, '1', 'Nghĩa từ Việt của từ バランス là:', 'làm rộng ra', '(mặt trời) chiếu sáng, mở (ô), nhỏ (thuốc mắt)', 'cân bằng', 'văn hóa', 'cân bằng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20802, 57, '1', 'Nghĩa từ Việt của từ レベル là:', 'nhựa', 'trình độ, level', 'dũng cảm, dũng khí', 'phát minh', 'trình độ, level');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20803, 57, '1', 'Nghĩa từ Việt của từ アップ là:', 'thế nào, bao nhiêu', 'truyền đi, giới thiệu', 'tăng lên', 'phạm vi', 'tăng lên');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20804, 57, '1', 'Nghĩa từ Việt của từ ダウン là:', 'giảm xuống', 'cảm động', 'không bao giờ', 'được xây', 'giảm xuống');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20805, 57, '1', 'Nghĩa từ Việt của từ プラス là:', 'đại thể, thường', 'phát triển', 'phép cộng, tác động tích cực', 'ghé vào', 'phép cộng, tác động tích cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20806, 57, '1', 'Nghĩa từ Việt của từ マイナス là:', 'tình nguyện', 'phép trừ, tác động tiêu cực', 'thất nghiệp', 'trao, cung cấp', 'phép trừ, tác động tiêu cực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20807, 57, '1', 'Nghĩa từ Việt của từ イメージ là:', 'hình ảnh', 'tháo, tuột', 'dựng lên', 'về quê', 'hình ảnh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20808, 57, '1', 'Nghĩa từ Việt của từ コンテスト là:', 'quan trọng', 'cố hương', 'cảm thấy', 'cuộc thi', 'cuộc thi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20809, 57, '1', 'Nghĩa từ Việt của từ マスコミ là:', 'lẫn nhau', 'có thể, được xây dựng', 'thông tin truyền thông', 'kết nối, làm chặt thêm', 'thông tin truyền thông');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20810, 57, '1', 'Nghĩa từ Việt của từ プライバシー là:', 'sản phẩm', 'cá nhân, riêng tư', 'loại', 'chính xác', 'cá nhân, riêng tư');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20811, 57, '1', 'Nghĩa từ Việt của từ オフィス là:', 'cài đặt, set', 'loáng một cái', 'người trưởng thành', 'văn phòng', 'văn phòng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20812, 57, '1', 'Nghĩa từ Việt của từ ルール là:', 'luật lệ', 'kẹt xỉ', 'lỗ', 'sau cùng, cuối cùng, sau tất cả', 'luật lệ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20813, 57, '1', 'Nghĩa từ Việt của từ マナー là:', 'kiểu, thói', 'cao nhất', 'say', 'bất an', 'kiểu, thói');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20814, 57, '1', 'Nghĩa từ Việt của từ ミス là:', 'phát minh', 'lo lắng', 'lỗi', 'mất', 'lỗi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20815, 57, '1', 'Nghĩa từ Việt của từ スケジュール là:', 'hỏng', 'giả', 'lịch, kế hoạch', 'xuất hiện, được thẻ hiện', 'lịch, kế hoạch');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20816, 57, '1', 'Nghĩa từ Việt của từ タイトル là:', 'bị ướt', 'thăm', 'tiêu đề', 'mũ bảo hiểm', 'tiêu đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20817, 57, '1', 'Nghĩa từ Việt của từ テーマ là:', 'chủ đề', 'tiền bối', 'đăng ký', 'nhất định', 'chủ đề');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20818, 57, '1', 'Nghĩa từ Việt của từ ストーリー là:', 'toàn bộ', 'dựng lên', 'câu chuyện', 'trình độ, level', 'câu chuyện');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20819, 57, '1', 'Nghĩa từ Việt của từ ヒット là:', 'thông tin', 'xung quanh', 'vất vả, mệt mỏi', 'nổi tiếng', 'nổi tiếng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20820, 57, '1', 'Nghĩa từ Việt của từ ブランド là:', 'nướng, nấu', 'nhãn hiệu', 'lặp lại', 'da', 'nhãn hiệu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20821, 57, '1', 'Nghĩa từ Việt của từ レンタル là:', 'giảm', 'thuê', 'che giấu', 'đăng ký', 'thuê');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20822, 57, '1', 'Nghĩa từ Việt của từ リサイクル là:', 'bằng cấp, tư cách', 'tái chế', 'trái đất', 'tính chất', 'tái chế');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20823, 57, '1', 'Nghĩa từ Việt của từ ラベル là:', 'nhãn', 'thiệt hại', 'đạt được, có được', 'kiến thức', 'nhãn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20824, 57, '1', 'Nghĩa từ Việt của từ タイプ là:', 'loại', 'thức dậy', 'bề trên', 'ôm', 'loại');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20825, 57, '1', 'Nghĩa từ Việt của từ スタイル là:', 'có lẽ', 'giết', 'kiểu dáng', 'kịp giờ', 'kiểu dáng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20826, 57, '1', 'Nghĩa từ Việt của từ セット là:', 'cài đặt, set', 'quan tâm, thông cảm', 'chụp', 'trái đất', 'cài đặt, set');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20827, 57, '1', 'Nghĩa từ Việt của từ ウイルス là:', 'virus', 'gửi', 'thế thì', 'giúp đỡ', 'virus');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20828, 57, '1', 'Nghĩa từ Việt của từ ロボット là:', 'mạnh lên', 'về quê', 'thực hành', 'robot', 'robot');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20829, 57, '1', 'Nghĩa từ Việt của từ エネルギー là:', 'bằng mọi giá, rất (muốn)', 'năng lượng', 'toàn bộ', 'tiến bộ', 'năng lượng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20830, 57, '1', 'Nghĩa từ Việt của từ デジタル là:', 'bị giảm', 'kỹ thuật số', 'lần lượt, tương ứng', 'năng lượng', 'kỹ thuật số');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20831, 57, '1', 'Nghĩa từ Việt của từ マイク là:', 'hiểu, thông qua', 'bầu cử', 'microphone, ghi âm', 'mở rộng, bùng phát, lan tràn, trải dài', 'microphone, ghi âm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20832, 57, '1', 'Nghĩa từ Việt của từ ブレーキ là:', 'lừa', 'phanh', 'bị chôn', 'đàn ông', 'phanh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20833, 57, '1', 'Nghĩa từ Việt của từ ペンキ là:', 'nghiện', 'cay cú', 'sơn', 'so sánh', 'sơn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20834, 57, '1', 'Nghĩa từ Việt của từ 炊ける là:', 'tiến lên', 'kiểu, thói', 'được nấu', 'giải quyết', 'được nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20835, 57, '1', 'Nghĩa từ Việt của từ 炊く là:', 'suy nghĩ, cảm giác', 'vô ý, buột', 'tiến lên', 'nấu', 'nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20836, 57, '1', 'Nghĩa từ Việt của từ 煮える là:', 'xây', 'được nấu, được ninh', 'thu thập, được thu thập', 'giá cả, vật giá', 'được nấu, được ninh');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20837, 57, '1', 'Nghĩa từ Việt của từ 煮る là:', 'nấu, ninh, luộc', 'suốt đời', 'rung, vẫy', 'nhãn hiệu', 'nấu, ninh, luộc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20838, 57, '1', 'Nghĩa từ Việt của từ 炒める là:', 'mang đến gần', 'rán', 'đánh', 'ghi lại', 'rán');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20839, 57, '1', 'Nghĩa từ Việt của từ 焼ける là:', 'được nấu, được nướng', 'da', 'làm nguội', 'quốc tịch', 'được nấu, được nướng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20840, 58, '1', 'Nghĩa từ Việt của từ 焼く là:', 'hỏng', 'bọc', 'nướng, nấu', 'hướng đến, quay', 'nướng, nấu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20841, 58, '1', 'Nghĩa từ Việt của từ ゆでる là:', 'luộc', 'vỗ tay', 'giống', 'da', 'luộc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20842, 58, '1', 'Nghĩa từ Việt của từ 揚げる là:', 'phát triển', 'rán ngập', 'bị chôn', 'điều hòa ấm', 'rán ngập');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20843, 58, '1', 'Nghĩa từ Việt của từ 蒸す là:', 'thức dậy', 'ghé sát, lại gần', 'hấp', 'bất an', 'hấp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20844, 58, '1', 'Nghĩa từ Việt của từ ぐっすり là:', 'khác', 'suốt đời', 'say', 'shock, choáng', 'say');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20845, 58, '1', 'Nghĩa từ Việt của từ きちんと là:', 'bị thừa', 'thuê', 'cảm thấy', 'ngay ngắn', 'ngay ngắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20846, 58, '1', 'Nghĩa từ Việt của từ しっかり là:', 'kiên quyết, chắc chắn, đáng tin cậy', 'hối hận', 'hồi phục', 'sau cùng, cuối cùng, sau tất cả', 'kiên quyết, chắc chắn, đáng tin cậy');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20847, 58, '1', 'Nghĩa từ Việt của từ はっきり là:', 'rõ ràng', 'tiến lên', 'tách ra', 'bị gãy', 'rõ ràng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20848, 58, '1', 'Nghĩa từ Việt của từ じっと là:', 'con dấu', 'kiên nhẫn, chăm chú, chằm chằm', 'đặc trưng', 'vất vả, mệt mỏi', 'kiên nhẫn, chăm chú, chằm chằm');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20849, 58, '1', 'Nghĩa từ Việt của từ そっと là:', 'tự kiểm tra', 'nhẹ nhàng, yên lặng', 'cháy', 'thịnh vượng', 'nhẹ nhàng, yên lặng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20850, 58, '1', 'Nghĩa từ Việt của từ 別々に là:', 'tiền bối', 'riêng biệt', 'giảm', 'phương đông', 'riêng biệt');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20851, 58, '1', 'Nghĩa từ Việt của từ それぞれ là:', 'chịu đựng giỏi', 'lần lượt, tương ứng', 'văn hóa', 'ngon', 'lần lượt, tương ứng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20852, 58, '1', 'Nghĩa từ Việt của từ 互いに là:', 'đủ', 'bị giảm', 'lẫn nhau', 'gián đoạn', 'lẫn nhau');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20853, 58, '1', 'Nghĩa từ Việt của từ 直接 là:', 'trực tiếp', 'chiêu đãi', 'làm bẩn', 'da', 'trực tiếp');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20854, 58, '1', 'Nghĩa từ Việt của từ 本当に là:', 'thật lòng, kỳ thực', 'về quê', 'ghé vào', 'ghi lại', 'thật lòng, kỳ thực');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20855, 58, '1', 'Nghĩa từ Việt của từ 必ず là:', 'kiến thức', 'quan trọng', 'chắc chắn', '(đêm) đến, (năm mới) bắt đầu, (mùa mưa) kết thúc', 'chắc chắn');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20856, 58, '1', 'Nghĩa từ Việt của từ 絶対に là:', 'tính chất', 'tốt, đủ', 'đóng gói', 'chắc chắn rồi', 'chắc chắn rồi');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20857, 58, '1', 'Nghĩa từ Việt của từ 特に là:', 'bảnh bao', 'đặc biệt là', 'nhất định', 'tiết kiệm', 'đặc biệt là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20858, 58, '1', 'Nghĩa từ Việt của từ ただ là:', 'đông đúc', 'chỉ', 'bị đánh', 'chuyển nhà', 'chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20859, 58, '1', 'Nghĩa từ Việt của từ 少なくとも là:', 'ghé vào', 'vô lý', 'ít nhất', 'bị gãy', 'ít nhất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20860, 58, '1', 'Nghĩa từ Việt của từ 決して là:', 'quấn, quàng', 'tắc đường', 'dựng lên', 'không bao giờ', 'không bao giờ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20861, 58, '1', 'Nghĩa từ Việt của từ 少しも là:', 'hội, tiệc', 'thấp nhất', 'một chút', 'mọc', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20862, 58, '1', 'Nghĩa từ Việt của từ ちっとも là:', 'dán', 'nấm mốc', '(không) tí gì', 'bình thường', '(không) tí gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20863, 58, '1', 'Nghĩa từ Việt của từ 全く là:', 'hoạt động', 'hoàn toàn (không)', 'giận dữ', 'mời, rủ', 'hoàn toàn (không)');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20864, 58, '1', 'Nghĩa từ Việt của từ とても là:', 'thông dịch', 'rất', 'rung, vẫy', 'vết thương', 'rất');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20865, 58, '1', 'Nghĩa từ Việt của từ どんなに là:', 'tiền lẻ', 'rất', 'thế nào, bao nhiêu', 'tài nguyên', 'thế nào, bao nhiêu');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20866, 58, '1', 'Nghĩa từ Việt của từ どうしても là:', 'bầu cử', 'kiểu gì cũng', 'cao nhất', 'như mọi khi', 'kiểu gì cũng');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20867, 58, '1', 'Nghĩa từ Việt của từ まるで là:', 'như là', 'ký sự', 'sống', 'lớn lên, tăng thêm, dài ra', 'như là');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20868, 58, '1', 'Nghĩa từ Việt của từ 一体 là:', 'cái quái gì', 'tươi', 'suốt đời', 'đủ', 'cái quái gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20869, 58, '1', 'Nghĩa từ Việt của từ 別に là:', 'chăm sóc', '(không) có gì', 'mũ bảo hiểm', 'lý giải', '(không) có gì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20870, 58, '1', 'Nghĩa từ Việt của từ たった là:', 'đăng ký', 'quan hệ', 'bị ướt', 'chỉ', 'chỉ');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20871, 58, '1', 'Nghĩa từ Việt của từ ほんの là:', 'lý giải', 'tuyên truyền', 'một chút', 'giống', 'một chút');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20872, 58, '1', 'Nghĩa từ Việt của từ それで là:', 'thuê', 'kiểu gì cũng', 'sôi', 'thế thì', 'thế thì');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20873, 58, '1', 'Nghĩa từ Việt của từ そこで là:', 'nghệ thuật', 'cầu, khấn', 'tiếp theo', 'trung bình', 'tiếp theo');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20874, 58, '1', 'Nghĩa từ Việt của từ そのうえ là:', 'làm rộng ra', 'thế kỷ', 'hơn nữa', 'xung đột, xếp chồng', 'hơn nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20875, 58, '1', 'Nghĩa từ Việt của từ また là:', 'hiểu, thông qua', 'nữa', 'lo lắng', 'mạnh, giỏi', 'nữa');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20876, 58, '1', 'Nghĩa từ Việt của từ または là:', 'hoặc', 'được sinh ra', 'được tìm thấy', 'bao phủ', 'hoặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20877, 58, '1', 'Nghĩa từ Việt của từ それとも là:', 'quê quán', 'hàng', 'triệu chứng', 'hoặc', 'hoặc');
    

    INSERT INTO "Question" (question_id, lesson_id, type, question_content, option_1, option_2, option_3, option_4, correct_answer)
    VALUES (20878, 58, '1', 'Nghĩa từ Việt của từ つまり là:', 'bị gãy', 'nói cách khác', 'bị chôn', 'sinh', 'nói cách khác');
    
