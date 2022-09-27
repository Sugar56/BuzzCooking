# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "hoge@hoge",
    password: "111111"
)

Tag.create([
    { name: '肉料理' },
    { name: '魚料理' },
    { name: '麺料理' },
    { name: '野菜料理' },
    { name: 'スイーツ' },
    { name: '串料理' },
    { name: '鍋料理' },
    { name: '郷土料理' },
    { name: '丼もの' },
    { name: '揚げ物' },
    { name: '粉物' },
    { name: 'その他' },
    ])

User.create!(
  [
    { last_name: '令和', first_name: '太郎', last_name_kana: 'レイワ', first_name_kana: 'タロウ', address: '東京都渋谷区代々木神園町0-0', telephone_number: '00011112222', email: 'reiwa@test.com', password: 'aaaaaa', name: '令和くん', self_introduction: 'よろしくお願いします！', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/asia.jpg"), filename:"asia.jpg") },
    { last_name: '平成', first_name: '二郎', last_name_kana: 'ヘイセイ', first_name_kana: 'ジロウ', address: '東京都渋谷区代々木神園町1-1', telephone_number: '33344445555', email: 'heisei@test.com', password: 'bbbbbb', name: '平成くん', self_introduction: '料理初心者です。', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/desert.jpg"), filename:"desert.jpg") },
    { last_name: '昭和', first_name: '花子', last_name_kana: 'ショウワ', first_name_kana: 'ハナコ', address: '東京都渋谷区代々木神園町2-2', telephone_number: '66677778888', email: 'syouwa@test.com', password: 'cccccc', name: '花子ちゃん', self_introduction: '料理大好きです！', is_deleted: 'false', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/japan.jpg"), filename:"japan.jpg") }
  ]
)

Genre.create!(
  [
    { name: '洋食' },
    { name: '和食' },
    { name: '中華' }
  ]
)

Recipe.create!(
  [
    {
      name: 'RecipeName',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/asia.jpg"), filename:"asia.jpg"),
      serving: 1,
      genre_id: 1,
      recipe_explanation: "recipe_explanation",
      point_explanation: "point_explanation",
      tag_ids:[ 1, 2 ],
      ingredients_attributes:[{
        name: "ingredients_name",
        amount: 1,
      }],
      cooking_methods_attributes:[{
        cooking_explanation: "cooking_explanation",
        step: "step",
      }],
    },
    {
      name: 'RecipeName',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/asia.jpg"), filename:"asia.jpg"),
      serving: 1,
      genre_id: 1,
      recipe_explanation: "recipe_explanation",
      point_explanation: "point_explanation",
      tag_ids:[ 1, 2 ],
      ingredients_attributes:[{
        name: "ingredients_name",
        amount: 1,
      }],
      cooking_methods_attributes:[{
        cooking_explanation: "cooking_explanation",
        step: "step",
      }],
    }
  ]
)
