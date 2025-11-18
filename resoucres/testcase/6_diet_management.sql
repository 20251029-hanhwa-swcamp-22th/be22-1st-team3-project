# 6. 식단 관리
    # (1) 아침 식단 생성
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '조식', NULL, 6);

SET @breakfast_diet_num = LAST_INSERT_ID();

    # 아침 식단 생성 확인
SELECT * FROM Diet WHERE diet_num = @breakfast_diet_num;

    # (2) 아침 식단에 넣을 음식 검색
SET @salad_food_num = (
    SELECT food_num
    FROM Food
    WHERE food_name = '닭가슴살'
    LIMIT 1
);

        #아침 식단 넣을 음식 검색 확인
SELECT @salad_food_num AS '닭가슴살 food_num';


        # (3) 아침 식단에 추가
INSERT INTO DietItem (item_amount, diet_num, food_num)
VALUES (150, @breakfast_diet_num, @salad_food_num);

        # 아침 식단 항목 조회
SELECT * FROM DietItem WHERE diet_num = @breakfast_diet_num;


        # (4) '점심' 식단 생성
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '중식', NULL, 6);
SET @lunch_diet_num = LAST_INSERT_ID();

SELECT * FROM diet;

        # 점심 식단 생성 확인
SELECT * FROM Diet WHERE diet_num = @lunch_diet_num;

        # 2. 새로운 음식 등록
INSERT INTO Food (food_name, food_kcal, food_protein, food_cerb, food_fat, food_weight)
VALUES ('특제 프로틴 쉐이크', 300, 30, 15, 5, '300g');

SET @protein_food_num = LAST_INSERT_ID();

        #   등록된 커스텀 음식 조회
SELECT * FROM Food WHERE food_num = @protein_food_num;


        # (1) 점심 식단에 특제 프로틴 쉐이크 추가
INSERT INTO DietItem (item_amount, diet_num, food_num)
VALUES (300, @lunch_diet_num, @protein_food_num);


        # 점심 식단 아이템 조회
SELECT * FROM DietItem WHERE diet_num = @lunch_diet_num;


        # 3. 아침 식단 수정

SET @breakfast_item_num = (
    SELECT item_num
    FROM DietItem
    WHERE diet_num = @breakfast_diet_num
    LIMIT 1
);


UPDATE DietItem
SET item_amount = 180
WHERE item_num = @breakfast_item_num;


        # 아침 식단 수정된 아이템 조회
SELECT * FROM DietItem WHERE item_num = @breakfast_item_num;

        # 4. 저녁 식단 생성 → 삭제
INSERT INTO Diet (diet_date, diet_type, diet_memo, diet_user_num)
VALUES (NOW(), '석식', NULL, 6);

SET @dinner_diet_num = LAST_INSERT_ID();

        # 저녁 식단 생성 조회
SELECT * FROM Diet WHERE diet_num = @dinner_diet_num;
DELETE FROM DietItem
WHERE diet_num = @dinner_diet_num;

        # 저녁 식단 상세가 없는지 확인
SELECT * FROM DietItem WHERE diet_num = @dinner_diet_num;

SELECT * FROM diet;
        # 자체 삭제
DELETE FROM Diet
WHERE diet_num = @dinner_diet_num;

    # 5. 전체 결과 조회
SELECT
    D.diet_num,
    D.diet_type,
    F.food_name,
    DI.item_amount
FROM Diet D
LEFT JOIN DietItem DI ON D.diet_num = DI.diet_num
LEFT JOIN Food F ON DI.food_num = F.food_num
WHERE D.diet_user_num = 6
ORDER BY D.diet_num;

select * from dietitem;