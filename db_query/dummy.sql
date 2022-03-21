INSERT INTO public.field (id, name) VALUES (1, '전체');
INSERT INTO public.field (id, name) VALUES (2, 'O2O');
INSERT INTO public.field (id, name) VALUES (3, '여행');
INSERT INTO public.field (id, name) VALUES (4, '모바일결제');
INSERT INTO public.field (id, name) VALUES (5, '소셜데이팅');
INSERT INTO public.field (id, name) VALUES (6, '헬스케어');
INSERT INTO public.field (id, name) VALUES (7, '소셜네트워크');
INSERT INTO public.field (id, name) VALUES (8, '뷰티/패션');
INSERT INTO public.field (id, name) VALUES (9, '이커머스');
INSERT INTO public.field (id, name) VALUES (10, '엔터테인먼트');
INSERT INTO public.field (id, name) VALUES (11, '헬스/스포츠');
INSERT INTO public.field (id, name) VALUES (12, '뉴스/정보');
INSERT INTO public.field (id, name) VALUES (13, '금융');
INSERT INTO public.field (id, name) VALUES (14, '인테리어');
INSERT INTO public.field (id, name) VALUES (15, '종교');
INSERT INTO public.field (id, name) VALUES (16, '유통');
INSERT INTO public.field (id, name) VALUES (17, '플랫폼');
INSERT INTO public.field (id, name) VALUES (18, '게임');
INSERT INTO public.field (id, name) VALUES (19, '일정');
INSERT INTO public.field (id, name) VALUES (20, '기타');


INSERT INTO public.goal (id, name) VALUES (1, '전체');
INSERT INTO public.goal (id, name) VALUES (2, '기획-디자인');
INSERT INTO public.goal (id, name) VALUES (3, '프로젝트 개발');
INSERT INTO public.goal (id, name) VALUES (4, '프로젝트 출시');
INSERT INTO public.goal (id, name) VALUES (5, '창업');


INSERT INTO public.period (id, name) VALUES (1, '전체');
INSERT INTO public.period (id, name) VALUES (2, '1주-1개월');
INSERT INTO public.period (id, name) VALUES (3, '1개월-3개월');
INSERT INTO public.period (id, name) VALUES (4, '3개월 이상');


INSERT INTO public.position (id, name) VALUES (1, '전체');
INSERT INTO public.position (id, name) VALUES (2, '기획자');
INSERT INTO public.position (id, name) VALUES (3, '디자이너');
INSERT INTO public.position (id, name) VALUES (4, '개발자');


INSERT INTO public.position_num (id, name) VALUES (1, '0');
INSERT INTO public.position_num (id, name) VALUES (2, '1');
INSERT INTO public.position_num (id, name) VALUES (3, '2');
INSERT INTO public.position_num (id, name) VALUES (4, '3');
INSERT INTO public.position_num (id, name) VALUES (5, '4');
INSERT INTO public.position_num (id, name) VALUES (6, '5');
INSERT INTO public.position_num (id, name) VALUES (7, '6');
INSERT INTO public.position_num (id, name) VALUES (8, '7');


INSERT INTO public.tag (id, name) VALUES (1, '전체');
INSERT INTO public.tag (id, name) VALUES (2, '진취적인');
INSERT INTO public.tag (id, name) VALUES (3, '목표지향적인');
INSERT INTO public.tag (id, name) VALUES (4, '결단력있는');
INSERT INTO public.tag (id, name) VALUES (5, '지도력있는');
INSERT INTO public.tag (id, name) VALUES (6, '주도적인');
INSERT INTO public.tag (id, name) VALUES (7, '열정적인');
INSERT INTO public.tag (id, name) VALUES (8, '영향력있는');
INSERT INTO public.tag (id, name) VALUES (9, '사교적인');
INSERT INTO public.tag (id, name) VALUES (10, '창의적인');
INSERT INTO public.tag (id, name) VALUES (11, '신뢰가가는');
INSERT INTO public.tag (id, name) VALUES (12, '안정적인');
INSERT INTO public.tag (id, name) VALUES (13, '일관적인');
INSERT INTO public.tag (id, name) VALUES (14, '신중한');
INSERT INTO public.tag (id, name) VALUES (15, '협력적인');
INSERT INTO public.tag (id, name) VALUES (16, '배려하는');
INSERT INTO public.tag (id, name) VALUES (17, '논리적인');
INSERT INTO public.tag (id, name) VALUES (18, '분석적인');
INSERT INTO public.tag (id, name) VALUES (19, '객관적인');
INSERT INTO public.tag (id, name) VALUES (20, '빈틈없는');
INSERT INTO public.tag (id, name) VALUES (21, '체계적인');
INSERT INTO public.tag (id, name) VALUES (22, '몰두하는');
INSERT INTO public.tag (id, name) VALUES (23, '사려깊은');
INSERT INTO public.tag (id, name) VALUES (24, '독려하는');
INSERT INTO public.tag (id, name) VALUES (25, '실용적인');
INSERT INTO public.tag (id, name) VALUES (26, '통제력있는');
INSERT INTO public.tag (id, name) VALUES (27, '순발력있는');
INSERT INTO public.tag (id, name) VALUES (28, '모험적인');


INSERT INTO public.type (id, name) VALUES (1, '직진하는 깡블리');
INSERT INTO public.type (id, name) VALUES (2, '재기발랄한 팀블리');
INSERT INTO public.type (id, name) VALUES (3, '프로조율러 옼블리');
INSERT INTO public.type (id, name) VALUES (4, '빈틈없는 꼭블리');
INSERT INTO public.type (id, name) VALUES (5, '든든한 캡틴 캡블리');
INSERT INTO public.type (id, name) VALUES (6, '철두철미한 꼼블리');
INSERT INTO public.type (id, name) VALUES (7, '자존감지키미 러블리');
INSERT INTO public.type (id, name) VALUES (8, '원칙주의 룰블리');


INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (1, 1, 2);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (2, 1, 3);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (3, 1, 4);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (4, 1, 5);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (5, 1, 6);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (6, 2, 7);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (7, 2, 8);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (8, 2, 9);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (9, 2, 10);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (10, 2, 11);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (11, 3, 12);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (12, 3, 13);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (13, 3, 14);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (14, 3, 15);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (15, 3, 16);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (16, 4, 17);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (17, 4, 18);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (18, 4, 19);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (19, 4, 20);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (20, 4, 21);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (21, 5, 5);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (22, 5, 7);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (23, 5, 8);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (24, 5, 27);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (25, 5, 28);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (26, 6, 3);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (27, 6, 4);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (28, 6, 18);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (29, 6, 22);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (30, 6, 21);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (31, 7, 15);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (32, 7, 11);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (33, 7, 23);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (34, 7, 24);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (35, 7, 16);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (36, 8, 25);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (37, 8, 17);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (38, 8, 13);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (39, 8, 14);
INSERT INTO public.type_tag (id, type_id, tag_id) VALUES (40, 8, 26);