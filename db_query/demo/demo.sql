-- 모든 테이블 정보 지우기
DELETE FROM member WHERE id>0;

DELETE FROM project_poke WHERE id>0;
DELETE FROM project_tag WHERE id>0;
DELETE FROM project_position WHERE id>0;
DELETE FROM project_period WHERE id>0;
DELETE FROM project_goal WHERE id>0;
DELETE FROM project_field WHERE id>0;
DELETE FROM project WHERE id>0;

DELETE FROM user_poke WHERE id>0;
DELETE FROM user_position WHERE id>0;
DELETE FROM user_field WHERE id>0;
DELETE FROM "user" WHERE id>0;

-- 테이블 정보 추가하기
--1
ALTER SEQUENCE user_user_id_seq RESTART WITH 1;

INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (20, 'firebaseid20', '현세빈', 'javees7@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/20%ED%98%84%EC%84%B8%EB%B9%88.jpeg?alt=media&token=cf88dcb8-2693-47e8-b2d5-fe87aa995ae3', 3, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 현세빈입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (21, 'firebaseid21', '최현지', 'javees8@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/21%EC%B5%9C%ED%98%84%EC%A7%80.jpg?alt=media&token=a2c9bc76-0d53-49d6-a610-1f1f457c07d1', 7, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 최현지입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (23, 'firebaseid23', '이남걸', 'javees10@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/23%EC%9D%B4%EB%82%A8%EA%B1%B8.jpg?alt=media&token=adc1150a-4287-4a7b-b041-eb9a586d4154', 3, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 이남걸입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (18, 'firebaseid18', '박태준', 'javees5@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/18%EB%B0%95%ED%83%9C%EC%A4%80.jpg?alt=media&token=b78c2f9c-6991-41a5-b974-897b4b284524', 8, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '개발하는 기획자 박태준입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 11:28:47.831748', '2022-01-21 16:40:47.772116', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (12, 'firebaseid12', '김다운', 'kimkim@naver.com', '010-1234-5678', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/12%EA%B9%80%EB%8B%A4%EC%9A%B4-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=a1e6525e-2bc9-4101-bf25-3cbd093ab0d9', 4, '동덕여자대학교', '국제경영학과 ', '서울', '심장이 뛰는 선택을 하는 기획자 김다운입니다!', '관심있는 분야에서 열정을 멈추지 않고 달릴 자신이 있는 기획자 입니다.
함께 즐겁고 행복한 프로젝트를 만들어봅시다. 절겨봐요 !', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (26, 'firebaseid26', '최준혁', 'javees13@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/26%EC%B5%9C%EC%A4%80%ED%98%81-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpg?alt=media&token=75fdb82f-1e69-491d-ae4d-1375e89894ae', 3, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 최준혁입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (24, 'firebaseid24', '배지안', 'javees11@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/24%EB%B0%B0%EC%A7%80%EC%95%88.jpg?alt=media&token=5725469d-3dc2-43ec-ad56-cfab64233104', 7, '서울시립대학교', '경제학과', '연남, 홍대', '성실한 기획자 배지안입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 11:28:47.831748', '2022-01-21 18:23:51.167700', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (31, 'firebaseid31', '오수린', 'javees@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/31%EC%98%A4%EC%88%98%EB%A6%B0.jpg?alt=media&token=525e6767-f3ff-4564-adfe-0e43b54efe48', 7, '한국외국어대학교', '중국어, 데이터 분석', '연남, 홍대', '성실한 기획자 오수린입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 12:25:48.762514', '2022-01-21 19:38:15.021091', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (16, 'firebaseid16', '곽민주', 'javees3@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/16%EA%B3%BD%EB%AF%BC%EC%A3%BC.jpg?alt=media&token=3904146f-c6bc-4042-8b79-52115010d5a3', 2, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '디자인하는 기획자 곽민주입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (14, 'firebaseid14', '김인우', 'javees1@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/14%EA%B9%80%EC%9D%B8%EC%9A%B0.png?alt=media&token=03f650ad-0462-4c08-ada9-9231362613ee', 6, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '디자인하는 기획자 김인우입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (6, 'firebaseid6', '김연이', 'rlakuku1221@gmail.com', '010-9568-1045', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/6%EA%B9%80%EC%97%B0%EC%9D%B4-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=ff09ebde-422f-4303-9a13-59e618199cf7', 7, '동덕여자대학교', '컴퓨터공학과', '서울 전체 ', '열정적으로 개발하는 웹 개발자, 김연이입니다', '안녕하세요 개발자 김연이입니다.
저는 개발할 때 ~~ 점을 중요하게 생각해요.
한 번 시작한 프로젝트는 열정적으로 개발하는 스타일입니다. ', true, '2022-01-19 10:43:14.157231', '2022-01-20 14:04:05.955060', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (5, 'firebaseid5', '노유정', 'no7913@gmail.com', '010-2827-7913', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/5%EB%85%B8%EC%9C%A0%EC%A0%95.png?alt=media&token=2de442b7-75be-4a08-a9a0-189ba6a33749', 6, '한양대 에리카', '광고홍보학과 ', '경기 산본, 서울', '얼레벌떡 토끼 디자이너, 노유정입니다', '반갑습니다 디자이너 노유정입니다.
~을 계기로 광고홍보학과에 지원했습니다.
휴학을 계기로 인턴 생활을 거치면서 브랜딩에 대한 관심이 높아졌어요.
그저 그런 디자인이 아닌 본질을 탐구하고 적용시킬 수 있는 디자이너입니다.', true, '2022-01-19 10:42:50.833998', '2022-01-19 10:42:50.833998', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (7, 'firebaseid7', '정세연', 'seyeon@gmail.com', '010-4199-3164', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/7%EC%A0%95%EC%84%B8%EC%97%B0-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=a0fd16a0-0b9d-4a2b-86de-bf8674bd14b0', 7, '세종대학교', '컴퓨터공학과', '역삼역,강남', '열정적으로 공부하고 성장하는 예리한 개발자, 정세연입니다', '안녕하세요 웹개발자 정세연이라고 합니다.
웹개발을 시작한 지는 ~~마나 되었고
~을 계기로 웹 개발에 관심을 갖고 집중적으로 임하게 되었습니다.
앞으로 ~~을 사용해서 공부해보고 ~~어떤 프로젝트를 해보고 싶습니다.', true, '2022-01-19 10:43:53.550084', '2022-01-19 10:43:53.550084', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (8, 'firebaseid8', '박건영', 'tekiter8@gmail.com', '010-3682-9979 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/8%EB%B0%95%EA%B1%B4%EC%98%81-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=6a88b0e6-fc55-4eca-a759-f5ec2d178fc4', 3, '가톨릭대학교', '컴퓨터공학과', '수지구청역, 분당', '개발을 좋아하는 당근당근 풀스택 천재 개발자, 박건영입니다', '안녕하세요 풀스택 개발자 박건영입니다.
마인크래프트 개발을 하고 싶어서 개발을 시작하게 되었는데
어느새 재미를 두고 개발을 하다보니 서버, 프론트, 백엔드 모두 섭렵한 풀스택 개발자가 되었습니다
개발 지식을 공유하고 가르쳐주는 것을 좋아해서 교수님이라는 별명도 얻었습니다ㅎㅎ
현재는 당근마켓에서 인턴하고 있습니다. 당근당근~~!!
탕비실에서 당근마켓 스티커 훔쳐와서 팀원들 나눠줄 정도로 정이 많고 배려심도 있어요!ㅎㅎ
귀여운 게 너무 좋아요 커비 최고', true, '2022-01-19 10:44:10.175741', '2022-01-19 10:44:10.175741', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (28, 'firebaseid28', '최호준', 'javees15@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/28%EC%B5%9C%ED%98%B8%EC%A4%80-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.png?alt=media&token=043a593c-4a41-4a3e-ab69-4062be0a6b00', 4, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '개발하는 기획자, 최호준입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (4, 'firebaseid4', '원종화', 'jongwha95@gmail.com', '010-2256-1873', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/4%EC%9B%90%EC%A2%85%ED%99%94-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.png?alt=media&token=7b32afbe-3d98-457c-b12d-2fb032d1a5e2', 3, '경희대학교', '산업디자인학과', '동탄, 강남', '곰돌이같지만 묵묵하고 예리한 척척 디자이너, 원종화입니다', '저는 팀블의 디자이너 원종화입니다.
팀블 행복합니다 💜', true, '2022-01-19 10:42:28.953618', '2022-01-21 18:02:34.143192', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (29, 'firebaseid29', '강영훈', 'javees16@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/29%EA%B0%95%EC%98%81%ED%9B%88.png?alt=media&token=4f6806a5-f55a-45dc-adfe-ee6f142b3b6c', 4, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 강영훈입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (19, 'firebaseid19', '김두범', 'javees6@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/19%EA%B9%80%EB%91%90%EB%B2%94.png?alt=media&token=fefb389b-b9af-4b8c-a8fe-f5763fc1bce9', 4, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 김두범입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (9, 'tNzuL8xfQ9Wa11mrajP0idQfptp2', '박현지', 'hj@naver.com', '010-9300-4349', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/9%EB%B0%95%ED%98%84%EC%A7%80.jpeg?alt=media&token=ec943dce-35b0-42a4-966d-bfd348effde0', 2, '홍익대학교', '컴퓨터공학과', '홍대, 이대', '안드 개발을 넘어서 서버 개발자에 도약 중인, 개발자 박현지입니다', '안녕하세요, 개발자 박현지입니다.
안드로이드 개발을 하다가 호기심에 서버 개발을 시작했었는데 서버 개발에 재미를 느끼고 더 큰 성장을 위해 도전하는 중입니다.
이러이러한 서비스를 만들어보고 싶고 무엇보다 팀원과의 좋은 협력 관계가 중요한 것 같아요
저 나름 재미있고 정도 많아서 친구같고 솔직한, 서비스에 진심인 팀을 이뤘으면 좋겠습니다.', true, '2022-01-19 10:44:43.015349', '2022-01-19 10:44:43.015349', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (10, 'firebaseid10', '김규민', 'q-bit-junior@gmail.com', '010-3225-6526', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/10%EA%B9%80%EA%B7%9C%EB%AF%BC.jpg?alt=media&token=314e5f9d-0015-4609-b28f-0caf32c2c94a', 1, '한양대학교', '자원환경공학', '왕십리역, 한양대역', '차근차근 성장해 나가는 개발자 김규민 입니다!', '전공은 자원환경공학이고 다준전공으로 융합전자공학부를 공부하다가 코딩에 관심을 갖게 되어 웹 개발에 입문하게 되었습니다.
좋은 개발자이자 좋은 팀원으로 여러분과 좋은 경험을 하고싶습니다. ', true, '2022-01-19 10:45:15.282779', '2022-01-21 11:51:52.472139', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (22, 'firebaseid22', '박지혜', 'javees9@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/22%EB%B0%95%EC%A7%80%ED%98%9C.jpeg?alt=media&token=c30fcf49-902f-477b-9899-63ef17bd7d68', 1, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '디자인하는 기획자 박지혜입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 11:28:47.831748', '2022-01-21 19:34:57.758120', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (11, 'firebaseid11', '문수빈', 'stoken@naver.com', '010-1234-5678', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/11%EB%AC%B8%EC%88%98%EB%B9%88-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=2e0cc380-6423-4a31-b597-f05cbf8d1da6', 1, '고려대학교', '일어일문, 인문학과 문화산업', '김포, 수원', '여러분과 함께할 서비스를 만들어 가고싶은 문수빈 입니다. ', '지금까지 문화기획과 관련된 활동을 해왔습니다.
최근 서비스 기획과 마케팅, 브랜딩에 관심이 많아지고 있습니다.
감사합니다!', false, '2022-01-19 11:28:47.831748', '2022-01-21 19:00:52.501147', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (1, 'vE1EDHq7khTawzKIGqgaxd9Aumj2', '심유나', 'una14@naver.com', '', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/%ED%8C%80%EB%B8%94-%ED%94%84%EB%A1%9C%ED%95%84%EA%B8%B0%EB%B3%B8.png?alt=media&token=4e011d36-ca51-4c50-addc-b93888cf9116', null, '', '', '', '', '', true, '2022-01-19 10:40:15.667553', '2022-01-21 19:05:18.280685', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (3, 'firebaseid3', '문규원', 'mgyu0101@gmail.com', '010-9686-2056', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/3%EB%AC%B8%EA%B7%9C%EC%9B%90.png?alt=media&token=adedcc75-9af5-4dba-8c08-91b76b8026c7', 7, '한국외국어대학교', '컴퓨터공학, 중국어 통번역', '서울 전체', '지속적으로 성장하는 서버 개발자 문규원 입니다!', '저는 본전공은 중국어 통번역, 이중전공은 컴퓨터 공학입니다!
천천히 하지만 촘촘히 개발 지식을 쌓아가며 성장하고 있습니다. ', true, '2022-01-19 10:42:04.974044', '2022-01-19 10:42:04.974044', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (2, '0YfRo4TeioNpqE5cLElRA5Mi0ui2', '손예현', 'yh@naver.com', '010-5794-3724', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/2%EC%86%90%EC%98%88%ED%98%84-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=9d1b2dbb-ca3a-4466-9c58-7a5724eae988', 3, '이화여자학교', '융합콘텐츠학과', '서울 전체, 신촌', '춤추는 고래같은 기획자, 손예현입니다', '안녕하세요 기획자 손예현입니다
세상에 도움이 되는 서비스를 만들고 싶다는 생각을 하게 되면서
서비스 기획에 관심을 갖기 시작했어요

저는 이런 사람이에요

칭찬 하나에 고래처럼 춤추고 열정을 불태울 줄 아는 사람
맡은 일에 누구보다 책임감있게 임하는 사람
공감과 경청의 자세로 귀를 기울이고 팀의 멘탈 관리를 담당하는 중재자
밝고 긍정적인 마인드로 팀의 활력을 불어넣는 사람', true, '2022-01-19 10:57:36.779270', '2022-01-19 19:39:08.306477', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (15, 'firebaseid15', '엄정원', 'javees2@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/15%EC%97%84%EC%A0%95%EC%9B%90-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=bd0a856f-ad3a-4b3c-909f-3d39f58090fd', 2, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 엄정원입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (25, 'firebaseid25', '김나영', 'javees12@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/25%EA%B9%80%EB%82%98%EC%98%81-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpg?alt=media&token=60a8255c-21ad-4424-bde7-0c29afca56f6', 7, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 김나영입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (32, 'firebaseid32', '박세은', 'suzieep@gmail.com', '010-7389-0560', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/32%EB%B0%95%EC%84%B8%EC%9D%80-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=89f90817-c9ca-48c5-abca-1ad716658c7b', 4, '중앙대학교', '약학과', '충무로', '성실한 기획자 박세은입니다! ', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을 꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 12:25:48.762514', '2022-01-19 12:25:48.762514', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (27, 'firebaseid27', '한아연', 'javees14@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/27%ED%95%9C%EC%95%84%EC%97%B0-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=bd8ec0a3-1e67-4b47-96ac-edd41f3f73a0', 7, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 한아연입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (13, 'firebaseid13', '정재용', 'javees@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/13%EC%A0%95%EC%9E%AC%EC%9A%A9.jpeg?alt=media&token=e3a20bb2-f4da-4bdd-8f48-984355f6fb85', 8, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '개발하는 기획자 정재용입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 11:28:47.831748', '2022-01-21 19:44:16.006832', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (17, 'firebaseid17', '이정재', 'javees4@naver.com', '010-2345-6789', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/17%EC%9D%B4%EC%A0%95%EC%9E%AC-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpg?alt=media&token=e385091a-e76f-4d49-8d0a-83959c3a532a', 7, '한양대학교', '컴퓨터소프트웨어학부', '연남, 홍대', '성실한 기획자 이정재입니다!', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', true, '2022-01-19 11:28:47.831748', '2022-01-19 11:28:47.831748', false);
INSERT INTO "user" (id, id_firebase, name, email, phone, photo, type_id, university, major, area, intro, description, is_checked, created_at, updated_at, is_deleted) VALUES (30, 'firebaseid30', '이수진', 'suzieep@gmail.com', '010-7389-0560', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/30%EC%9D%B4%EC%88%98%EC%A7%84-%EC%A0%95%EC%82%AC%EA%B0%81%ED%98%95.jpeg?alt=media&token=3faa9ce7-8231-433f-8983-87baf148d081', 4, '동국대학교', '컴퓨터공학과', '성신여대,보문역', '성실한 개발자이자 기획자 이수진 입니다. ', '좋아하는 일을 하자라는 모토로부터 기획자까지 꿈을꾸게 되었습니다.
새로운 도전, 행복한 인생, 그리고 경험과 값진 인생을 만들고
필요한 서비스를 만들고 싶습니다. 감사합니다!', false, '2022-01-19 12:25:48.762514', '2022-01-21 17:11:14.629159', false);

ALTER SEQUENCE user_user_id_seq RESTART WITH 33;

--2
ALTER SEQUENCE user_field_user_field_id_seq RESTART WITH 1;

INSERT INTO user_field (id, user_id, field_id) VALUES (62, 23, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (1, 2, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (4, 3, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (3, 3, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (67, 24, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (2, 3, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (6, 4, 15);
INSERT INTO user_field (id, user_id, field_id) VALUES (66, 24, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (65, 24, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (64, 23, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (63, 23, 11);
INSERT INTO user_field (id, user_id, field_id) VALUES (68, 25, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (69, 25, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (70, 25, 18);
INSERT INTO user_field (id, user_id, field_id) VALUES (72, 26, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (71, 26, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (73, 26, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (76, 27, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (74, 27, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (75, 27, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (78, 28, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (77, 28, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (79, 28, 17);
INSERT INTO user_field (id, user_id, field_id) VALUES (84, 30, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (83, 30, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (82, 29, 12);
INSERT INTO user_field (id, user_id, field_id) VALUES (81, 29, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (80, 29, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (91, 32, 12);
INSERT INTO user_field (id, user_id, field_id) VALUES (90, 32, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (89, 32, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (88, 31, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (87, 31, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (86, 31, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (85, 30, 12);
INSERT INTO user_field (id, user_id, field_id) VALUES (7, 4, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (5, 4, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (10, 5, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (8, 5, 2);
INSERT INTO user_field (id, user_id, field_id) VALUES (9, 5, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (11, 6, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (12, 6, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (13, 6, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (15, 7, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (14, 7, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (16, 7, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (18, 8, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (19, 8, 18);
INSERT INTO user_field (id, user_id, field_id) VALUES (17, 8, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (22, 9, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (20, 9, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (21, 9, 11);
INSERT INTO user_field (id, user_id, field_id) VALUES (23, 10, 2);
INSERT INTO user_field (id, user_id, field_id) VALUES (25, 10, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (24, 10, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (28, 11, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (27, 11, 14);
INSERT INTO user_field (id, user_id, field_id) VALUES (26, 11, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (29, 12, 4);
INSERT INTO user_field (id, user_id, field_id) VALUES (30, 12, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (31, 12, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (34, 13, 12);
INSERT INTO user_field (id, user_id, field_id) VALUES (32, 13, 5);
INSERT INTO user_field (id, user_id, field_id) VALUES (33, 13, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (35, 14, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (37, 14, 17);
INSERT INTO user_field (id, user_id, field_id) VALUES (36, 14, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (39, 15, 9);
INSERT INTO user_field (id, user_id, field_id) VALUES (38, 15, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (40, 15, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (43, 16, 15);
INSERT INTO user_field (id, user_id, field_id) VALUES (42, 16, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (41, 16, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (45, 17, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (46, 17, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (44, 17, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (47, 18, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (48, 18, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (49, 18, 14);
INSERT INTO user_field (id, user_id, field_id) VALUES (51, 19, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (52, 19, 19);
INSERT INTO user_field (id, user_id, field_id) VALUES (50, 19, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (55, 20, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (53, 20, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (54, 20, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (56, 21, 7);
INSERT INTO user_field (id, user_id, field_id) VALUES (58, 21, 16);
INSERT INTO user_field (id, user_id, field_id) VALUES (57, 21, 10);
INSERT INTO user_field (id, user_id, field_id) VALUES (60, 22, 13);
INSERT INTO user_field (id, user_id, field_id) VALUES (59, 22, 6);
INSERT INTO user_field (id, user_id, field_id) VALUES (61, 22, 16);

ALTER SEQUENCE user_field_user_field_id_seq RESTART WITH 92;

--3
ALTER SEQUENCE user_position_user_position_id_seq RESTART WITH 1;

INSERT INTO user_position (id, user_id, position_id) VALUES (1, 2, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (3, 3, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (5, 5, 3);
INSERT INTO user_position (id, user_id, position_id) VALUES (6, 6, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (7, 7, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (8, 8, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (9, 9, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (10, 10, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (11, 11, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (12, 12, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (13, 13, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (14, 13, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (15, 14, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (16, 14, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (17, 15, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (18, 15, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (19, 16, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (20, 16, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (21, 17, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (22, 17, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (23, 18, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (24, 18, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (25, 19, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (26, 19, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (27, 20, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (28, 20, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (29, 21, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (30, 21, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (31, 22, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (32, 22, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (33, 23, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (34, 23, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (35, 24, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (36, 24, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (37, 25, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (38, 25, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (39, 26, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (40, 26, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (41, 27, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (42, 27, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (43, 28, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (44, 28, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (45, 29, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (46, 29, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (47, 30, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (48, 30, 4);
INSERT INTO user_position (id, user_id, position_id) VALUES (49, 31, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (50, 32, 2);
INSERT INTO user_position (id, user_id, position_id) VALUES (51, 4, 3);

ALTER SEQUENCE user_position_user_position_id_seq RESTART WITH 52;

--4
ALTER SEQUENCE poke_poke_id_seq RESTART WITH 1;

INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (2, 3, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (3, 4, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (4, 5, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (5, 6, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (6, 7, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (7, 8, 2, false);
INSERT INTO user_poke (id, user_poking_id, user_poked_id, is_deleted) VALUES (8, 9, 2, false);

ALTER SEQUENCE poke_poke_id_seq RESTART WITH 9;

--5
ALTER SEQUENCE project_project_id_seq RESTART WITH 1;

INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (17, 22, '1%', '운동 메이트들과 함께 이뤄내는 바프 달성 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/17%201%25.png?alt=media&token=2f2ea8c7-44d4-4505-ad34-8d46da6b9840', '2022-01-21', '2022-02-09', '분당', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:59:39.625753', '2022-01-19 14:59:39.625753', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (12, 12, '비마이플랜', '내 취향애 맞는 기여행자의 여행 일정 컨텐츠 구매 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/12%20%EB%B9%84%EB%A7%88%EC%9D%B4%ED%94%8C%EB%9E%9C.png?alt=media&token=f511641f-9faa-4e5f-92ee-e85600d5c03b', '2022-01-21', '2022-02-28', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:44:10.331209', '2022-01-19 14:44:10.331209', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (9, 27, '소담', '우리의 설레는 소품샵 여정', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/9%20%EC%86%8C%EB%8B%B4.png?alt=media&token=efd08c43-a173-42c5-a57e-5ec15464d77e', '2022-01-21', '2022-02-01', '경기/인천', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:44:10.331209', '2022-01-19 14:44:10.331209', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (7, 28, '북스테어즈', '보다 똑똑한 독서를 도와드려요!', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/7%20%EB%B6%81%EC%8A%A4%ED%85%8C%EC%96%B4%EC%A6%88.png?alt=media&token=76a7e54f-930f-4d84-b2ba-ac1e2a829b7f', '2022-01-21', '2022-02-04', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:41:04.339608', '2022-01-19 14:41:04.339608', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (13, 10, '맛짱', '맛잘알들의 알찬 맛집 탐방을 위한 To- Eat- List', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/13%20%EB%A7%9B%EC%A7%B1.png?alt=media&token=217a02fa-2af7-433c-aac5-72e7e5923163', '2022-01-21', '2022-02-10', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:47:34.510704', '2022-01-19 14:47:34.510704', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (16, 25, 'SPORTING', '다함께 응원의 열기를, sporting !', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/16%20SPORTING.png?alt=media&token=444c10d6-420a-4f8b-9ce4-9e9df5c315c3', '2022-01-21', '2022-04-13', '인천', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:55:40.215762', '2022-01-19 14:55:40.215762', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (24, 12, '캘린두', '캘린더와 투두리스트를 하나의 앱에서 관리하는 올인원 일정관리 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/24%20%EC%BA%98%EB%A6%B0%EB%91%90.jpg?alt=media&token=b5379a54-ed20-41ea-80c8-af94da3179a7', '2022-01-21', '2022-02-27', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', true, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (25, 2, 'CardMe', '카드를 수집하며 채워가는 나라는 기록상자, 카드미', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/25%20CardMe.png?alt=media&token=eb8c6201-7372-4f6f-a321-f1ea9d186389', '2022-01-21', '2022-01-28', '서울 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050532', '2022-01-21 17:11:23.815415', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (27, 5, 'Re,MO:순간을 기억하다', '소중한 순간을 기억하는 부분 공유형 기록 플랫폼', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/27%20Re%2C%20MO.png?alt=media&token=afc04771-4b60-44c6-a2a7-2470837c6f89', '2022-01-21', '2022-01-27', '서울 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-21 19:04:33.325493', true, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (2, 13, 'SeeMeet', 'SeeMeet, 약속부터 만남까지 더 가까운 우리 사이', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/2%20SeeMeet.png?alt=media&token=04e363c5-387d-4db5-9893-33e771abe2d1', '2022-01-21', '2022-03-09', '서울 전체 ', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:36:34.020036', '2022-01-19 14:36:34.020036', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (26, 27, 'righter', '당신의 이야기가 시작되는 지금, righter ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/26%20righter.png?alt=media&token=76af07a0-ac62-49eb-b9b5-efc76389ac88', '2022-01-21', '2022-04-07', '서울 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', true, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (8, 22, 'Spark', '친구와 함께하는 66일간의 습관 형성 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/8%20Spark.png?alt=media&token=704a09b6-d12a-49a1-a242-f539fdc965cf', '2022-01-21', '2022-02-01', '경기/인천', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:44:10.331209', '2022-01-19 14:44:10.331209', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (19, 29, 'After Planner', '시간이 당신을 쫓지 않게, 당신이 시간을 쫓으세요.', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/19%20After%20Planner.png?alt=media&token=3c915731-5b19-4be5-9544-ed4405368eae', '2022-01-21', '2022-02-05', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:59:39.625753', '2022-01-19 14:59:39.625753', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (14, 31, '티켓와인드', '영화 리뷰가 막막한 당신을 위한 서비스', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/14%20%ED%8B%B0%EC%BC%93%EC%99%80%EC%9D%B8%EB%93%9C.png?alt=media&token=0465291a-631e-4eac-8342-74d8c8492a6a', '2022-01-21', '2022-02-28', '인천', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:54:20.605519', '2022-01-19 14:54:20.605519', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (3, 23, 'FILL-IN', '필름카메라 현상소, 필름정보 제공 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/3%20FILL-IN.png?alt=media&token=41aa5d1e-7eb3-4f4b-8a23-757e344995b2', '2022-01-21', '2022-02-05', '경기/인천', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:36:34.020036', '2022-01-19 14:36:34.020036', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (5, 24, '소복소복', '소중한 사람과 함께하는 복약 체크 서비스', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/5%20%EC%86%8C%EB%B3%B5%EC%86%8C%EB%B3%B5.png?alt=media&token=c9186c91-a2b1-418f-9f35-0e8b68ec73cc', '2022-01-21', '2022-02-15', '서울 전체 ', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:36:34.020036', '2022-01-19 14:36:34.020036', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (1, 30, '너가소개서', '나와 함께한 당신이 대신 써주는, 내 자기소개서', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/1%20%EB%84%88%EA%B0%80%EC%86%8C%EA%B0%9C%EC%84%9C.png?alt=media&token=5b0f55ff-ae66-45fc-8332-dddb6c11c4de', '2022-01-21', '2022-02-23', '서울 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:31:27.892288', '2022-01-19 14:31:27.892288', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (11, 16, '카드나', '내가 아는 나와 타인이 말하는 나를 통해 자신을 더 넓게 이해하고,자신의 다양한 모습을 표', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/11%20%EC%B9%B4%EB%93%9C%EB%82%98.png?alt=media&token=57142b8b-f10b-42ed-9ef8-bca50c75581f', '2022-01-21', '2022-02-05', '경기', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:44:10.331209', '2022-01-19 14:44:10.331209', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (20, 8, '루팅: Rootin -[g]', '출퇴근 루틴 관리& 컨텐츠 큐레이션', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/20%20%EB%A3%A8%ED%8C%85.png?alt=media&token=b0ece527-aea7-4e11-b97c-c8d0ac497d02', '2022-01-21', '2022-02-12', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:59:39.625753', '2022-01-20 19:24:53.473340', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (23, 14, 'COLORSET', '퍼스널컬러 기반 스타일링 확립 지원 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/23%20COLORSET.png?alt=media&token=c43f10c4-a4c5-41f2-b1b4-0d8120cb9700', '2022-01-21', '2022-03-25', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (10, 11, 'Beforeget', '당신의 미디어 소비, 지금 기록하세요!', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/10%20Beforeget.png?alt=media&token=91c384db-54ef-4f9b-8234-3b5275e8e934', '2022-01-21', '2022-02-22', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:44:10.331209', '2022-01-19 14:44:10.331209', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (28, 18, '링킵(LinKeep)', '나에게 유익한 글을 쉽게 저장하고 분류하는 링크관리앱 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/28%20%EB%A7%81%ED%82%B5.png?alt=media&token=a0fc8534-792e-433c-8ada-f23124b347b8', '2022-01-21', '2022-02-14', '서울 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', true, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (22, 4, '파랑바랑', '착한소비에 대한 접근성을 높여줍니다!', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/22%20%ED%8C%8C%EB%9E%91%EB%B0%94%EB%9E%91.png?alt=media&token=185ca311-5e3f-43d5-bf02-4149e7a5833c', '2022-01-21', '2022-02-09', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (18, 17, '팝티클: POPTICLE', '당신의 시야를 넓혀줄 아티클 큐레이션 서비스 ', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/18%20%ED%8C%9D%ED%8B%B0%ED%81%B4.png?alt=media&token=b710e558-f189-4458-9d4b-119a99cf0f2f', '2022-01-21', '2022-04-14', '경기도 전체', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:59:39.625753', '2022-01-19 14:59:39.625753', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (4, 26, '그로투', 'IT교육 강의 비교 플랫폼 서비스', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/4%20%EA%B7%B8%EB%A1%9C%ED%88%AC.png?alt=media&token=16e72fed-4cf2-4a75-a294-99a6a1dd3927', '2022-01-21', '2022-02-28', '서울 전체 ', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:36:34.020036', '2022-01-19 14:36:34.020036', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (6, 18, 'HAVIT', '콘텐츠를 저장하는 가장 쉬운 방법, Want it? Ssve it, Have it!', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/6%20HAVIT.png?alt=media&token=7da154c0-89b9-4cb1-8aa1-a6c3406a9797', '2022-01-21', '2022-01-29', '서울 전체 ', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-21 14:41:04.339608', '2022-01-19 14:41:04.339608', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (21, 21, '쇼퍼펙트', '당신의 사이즈 고민을 도와줄 쇼핑 메이트 너의 완벽한 핏을 보여줘!', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/21%20%EC%87%BC%ED%8D%BC%ED%8E%99%ED%8A%B8.jpg?alt=media&token=be206194-eff7-4f9c-8661-6565cdb60489', '2022-01-21', '2022-02-19', '서울', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 15:04:47.050533', '2022-01-19 15:04:47.050533', false, false);
INSERT INTO project (id, user_id, title, intro, photo, start_date, end_date, area, description, created_at, updated_at, is_closed, is_deleted) VALUES (15, 32, '에코', '환경을 생각하는 일상이 번져가는 공간', 'https://firebasestorage.googleapis.com/v0/b/teamble-server.appspot.com/o/15%20%EC%97%90%EC%BD%94.png?alt=media&token=cb368f57-737d-4aa4-a30a-d62d0cd51168', '2022-01-21', '2022-05-06', '서울 지역', '-서비스 아이디어 및  팀 소개

: 단순히 콘텐츠의 내용과 당시의 감정을 기록하는 것뿐 아니라
이 달의 미디어 소비를 돌아볼 수 있는 수단이 필요하다는 발상에서 시작되었습니다.
현재 저희 팀은 완벽하지 않아도 함께 즐거울 수 있는 유쾌하고 멋진 팀원들로 구성되어 있습니다.
서로 다른 우리가 모여 만드는 시너지와 가능성을 최우선 가치로 두고 있습니다.

-디자이너 사용 툴( ex. Figma, Sketch, Protopie, Xd, Photoshop, Illustrator, After Effects, C4D,Zeplin 등)
: Figma를 주요 협업툴로 사용할 예정입니다. 이외에도 Photoshop,Illustrator와 Photoshop을 기본적으로
접해보신 분이시면 좋을 것 같습니다.

-개발 스택( ex. 웹 :
Typescript, React.js 사용/서버:
자바, 스프링 프레임워크/ 안드로이드:
Java 또는 Kotlin 사용/ IOS:
Swift 언어 사용 등)

:
 서버: 자바
 안드로이드: Kotlin
 IOS: Swift 언어 사용할 예정입니다.


-개발 포지션( ex. 프론트, 백 등)

: 프론트 개발자 모집합니다.', '2022-01-19 14:55:40.215762', '2022-01-19 14:55:40.215762', false, false);

ALTER SEQUENCE project_project_id_seq RESTART WITH 29;

--6
ALTER SEQUENCE project_field_project_field_id_seq RESTART WITH 1;

INSERT INTO project_field (id, project_id, field_id) VALUES (1, 1, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (2, 1, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (3, 1, 9);
INSERT INTO project_field (id, project_id, field_id) VALUES (4, 2, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (5, 2, 19);
INSERT INTO project_field (id, project_id, field_id) VALUES (6, 2, 20);
INSERT INTO project_field (id, project_id, field_id) VALUES (7, 3, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (8, 3, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (9, 3, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (10, 4, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (11, 4, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (12, 4, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (13, 5, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (14, 5, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (15, 5, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (16, 6, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (17, 6, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (18, 6, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (19, 7, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (20, 7, 19);
INSERT INTO project_field (id, project_id, field_id) VALUES (21, 7, 20);
INSERT INTO project_field (id, project_id, field_id) VALUES (22, 8, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (23, 8, 19);
INSERT INTO project_field (id, project_id, field_id) VALUES (24, 8, 20);
INSERT INTO project_field (id, project_id, field_id) VALUES (25, 9, 2);
INSERT INTO project_field (id, project_id, field_id) VALUES (26, 9, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (27, 9, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (28, 10, 2);
INSERT INTO project_field (id, project_id, field_id) VALUES (29, 10, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (30, 10, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (31, 11, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (32, 11, 11);
INSERT INTO project_field (id, project_id, field_id) VALUES (33, 11, 13);
INSERT INTO project_field (id, project_id, field_id) VALUES (34, 12, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (35, 12, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (36, 12, 10);
INSERT INTO project_field (id, project_id, field_id) VALUES (37, 13, 4);
INSERT INTO project_field (id, project_id, field_id) VALUES (38, 13, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (39, 13, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (40, 14, 5);
INSERT INTO project_field (id, project_id, field_id) VALUES (41, 14, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (42, 14, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (43, 15, 2);
INSERT INTO project_field (id, project_id, field_id) VALUES (44, 15, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (45, 15, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (46, 16, 4);
INSERT INTO project_field (id, project_id, field_id) VALUES (47, 16, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (48, 16, 13);
INSERT INTO project_field (id, project_id, field_id) VALUES (49, 17, 5);
INSERT INTO project_field (id, project_id, field_id) VALUES (50, 17, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (51, 17, 9);
INSERT INTO project_field (id, project_id, field_id) VALUES (52, 18, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (53, 18, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (54, 18, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (55, 19, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (56, 19, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (57, 19, 10);
INSERT INTO project_field (id, project_id, field_id) VALUES (58, 20, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (59, 20, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (60, 20, 10);
INSERT INTO project_field (id, project_id, field_id) VALUES (61, 21, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (62, 21, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (63, 21, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (64, 22, 2);
INSERT INTO project_field (id, project_id, field_id) VALUES (65, 22, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (66, 22, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (67, 23, 1);
INSERT INTO project_field (id, project_id, field_id) VALUES (68, 23, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (69, 23, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (70, 24, 2);
INSERT INTO project_field (id, project_id, field_id) VALUES (71, 24, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (72, 24, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (73, 25, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (74, 25, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (75, 25, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (76, 26, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (77, 26, 8);
INSERT INTO project_field (id, project_id, field_id) VALUES (78, 26, 9);
INSERT INTO project_field (id, project_id, field_id) VALUES (79, 27, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (80, 27, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (81, 27, 7);
INSERT INTO project_field (id, project_id, field_id) VALUES (82, 28, 3);
INSERT INTO project_field (id, project_id, field_id) VALUES (83, 28, 6);
INSERT INTO project_field (id, project_id, field_id) VALUES (84, 28, 7);

ALTER SEQUENCE project_field_project_field_id_seq RESTART WITH 85;

--7
ALTER SEQUENCE project_goal_project_goal_id_seq RESTART WITH 1;

INSERT INTO project_goal (id, project_id, goal_id) VALUES (1, 1, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (4, 4, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (5, 5, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (6, 6, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (7, 7, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (8, 8, 3);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (9, 9, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (10, 10, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (11, 11, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (12, 12, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (13, 13, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (14, 14, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (15, 15, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (16, 16, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (17, 17, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (18, 18, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (19, 19, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (20, 20, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (21, 21, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (22, 22, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (23, 23, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (24, 24, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (25, 25, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (26, 26, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (27, 27, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (28, 28, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (2, 2, 4);
INSERT INTO project_goal (id, project_id, goal_id) VALUES (3, 3, 4);

ALTER SEQUENCE project_goal_project_goal_id_seq RESTART WITH 29;

--8
ALTER SEQUENCE project_period_project_period_id_seq RESTART WITH 1;

INSERT INTO project_period (id, project_id, period_id) VALUES (3, 3, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (5, 5, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (6, 6, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (7, 7, 4);
INSERT INTO project_period (id, project_id, period_id) VALUES (8, 8, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (9, 9, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (10, 10, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (11, 11, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (12, 12, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (13, 13, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (14, 14, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (15, 15, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (16, 16, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (17, 17, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (18, 18, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (19, 19, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (20, 20, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (21, 21, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (22, 22, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (23, 23, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (24, 24, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (25, 25, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (26, 26, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (27, 27, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (28, 28, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (1, 1, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (4, 4, 3);
INSERT INTO project_period (id, project_id, period_id) VALUES (2, 2, 3);

ALTER SEQUENCE project_period_project_period_id_seq RESTART WITH 29;

--9
ALTER SEQUENCE project_position_num_id_seq RESTART WITH 1;

INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (1, 1, 2, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (2, 1, 3, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (3, 1, 4, 8);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (4, 2, 2, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (5, 2, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (6, 2, 4, 8);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (7, 3, 2, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (8, 3, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (9, 3, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (10, 4, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (11, 4, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (12, 4, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (13, 5, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (14, 5, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (15, 5, 4, 7);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (16, 6, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (17, 6, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (18, 6, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (19, 7, 2, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (20, 7, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (21, 7, 4, 8);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (22, 8, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (23, 8, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (24, 8, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (25, 9, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (26, 9, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (27, 9, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (28, 10, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (29, 10, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (30, 10, 4, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (31, 11, 2, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (32, 11, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (33, 11, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (34, 12, 2, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (35, 12, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (36, 12, 4, 8);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (37, 13, 2, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (38, 13, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (39, 13, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (40, 14, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (41, 14, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (42, 14, 4, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (43, 15, 2, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (44, 15, 3, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (45, 15, 4, 7);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (46, 16, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (47, 16, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (48, 16, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (49, 17, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (50, 17, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (51, 17, 4, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (52, 18, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (53, 18, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (54, 18, 4, 8);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (55, 19, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (56, 19, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (57, 19, 4, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (58, 20, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (59, 20, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (60, 20, 4, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (61, 21, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (62, 21, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (63, 21, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (64, 22, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (65, 22, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (66, 22, 4, 1);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (67, 23, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (68, 23, 3, 4);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (69, 23, 4, 5);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (70, 24, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (71, 24, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (72, 24, 4, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (73, 25, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (74, 25, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (75, 25, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (76, 26, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (77, 26, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (78, 26, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (79, 27, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (80, 27, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (81, 27, 4, 6);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (82, 28, 2, 2);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (83, 28, 3, 3);
INSERT INTO project_position (id, project_id, position_id, position_num_id) VALUES (84, 28, 4, 6);

ALTER SEQUENCE project_position_num_id_seq RESTART WITH 85;

--10
ALTER SEQUENCE project_type_project_type_id_seq RESTART WITH 1;

INSERT INTO project_tag (id, project_id, tag_id) VALUES (1, 1, 2);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (2, 1, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (4, 1, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (8, 2, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (9, 2, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (10, 2, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (11, 3, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (13, 3, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (15, 3, 25);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (17, 4, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (18, 4, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (20, 4, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (22, 5, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (23, 5, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (25, 5, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (26, 6, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (27, 6, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (28, 6, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (29, 6, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (30, 6, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (31, 7, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (32, 7, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (33, 7, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (34, 7, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (35, 7, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (36, 8, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (37, 8, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (38, 8, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (39, 8, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (40, 8, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (41, 9, 2);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (42, 9, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (43, 9, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (44, 9, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (45, 9, 24);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (46, 10, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (47, 10, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (48, 10, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (49, 10, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (50, 10, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (51, 11, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (52, 11, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (53, 11, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (54, 11, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (55, 11, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (56, 12, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (57, 12, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (58, 12, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (59, 12, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (60, 12, 22);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (61, 13, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (62, 13, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (63, 13, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (64, 13, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (65, 13, 27);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (66, 14, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (67, 14, 4);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (68, 14, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (69, 14, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (70, 14, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (71, 15, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (72, 15, 9);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (73, 15, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (74, 15, 13);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (75, 15, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (76, 16, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (77, 16, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (78, 16, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (79, 16, 12);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (80, 16, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (81, 17, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (82, 17, 9);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (83, 17, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (84, 17, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (85, 17, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (86, 18, 2);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (87, 18, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (88, 18, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (89, 18, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (90, 18, 20);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (91, 19, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (92, 19, 4);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (93, 19, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (94, 19, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (95, 19, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (96, 20, 2);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (97, 20, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (98, 20, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (99, 20, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (100, 20, 21);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (101, 21, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (102, 21, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (103, 21, 14);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (104, 21, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (105, 21, 23);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (106, 22, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (107, 22, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (108, 22, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (109, 22, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (110, 22, 25);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (111, 23, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (112, 23, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (113, 23, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (114, 23, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (115, 23, 23);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (116, 24, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (117, 24, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (118, 24, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (119, 24, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (120, 24, 20);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (121, 25, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (122, 25, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (123, 25, 13);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (124, 25, 14);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (125, 25, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (126, 26, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (127, 26, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (128, 26, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (129, 26, 20);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (130, 26, 24);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (131, 27, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (132, 27, 8);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (133, 27, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (134, 27, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (135, 27, 27);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (136, 28, 3);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (137, 28, 6);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (138, 28, 7);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (139, 28, 11);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (140, 28, 16);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (12, 3, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (21, 5, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (5, 1, 13);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (24, 5, 14);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (6, 2, 14);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (19, 4, 13);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (3, 1, 14);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (7, 2, 15);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (16, 4, 10);
INSERT INTO project_tag (id, project_id, tag_id) VALUES (14, 3, 11);

ALTER SEQUENCE project_type_project_type_id_seq RESTART WITH 141;

--11
ALTER SEQUENCE project_poke_project_poke_id_seq RESTART WITH 1;

INSERT INTO project_poke (id, user_id, project_id, is_deleted) VALUES (3, 6, 25, false);
INSERT INTO project_poke (id, user_id, project_id, is_deleted) VALUES (1, 4, 25, false);
INSERT INTO project_poke (id, user_id, project_id, is_deleted) VALUES (2, 5, 25, false);

ALTER SEQUENCE project_poke_project_poke_id_seq RESTART WITH 4;