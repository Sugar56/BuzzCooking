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
    { name: '米料理' },
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
      name: '絶品ナポリタン',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/naporitan.jpeg"), filename:"naporitan.jpeg"),
      serving: 1,
      genre_id: 1,
      recipe_explanation: "シンプルで美味しい！",
      point_explanation: "味付けはケチャップのみ！",
      tag_ids:[ 4, 12 ],
      ingredients_attributes:[
        {
        name: "パスタ",
        amount: "100g",
        },
        {
        name: "マッシュルーム",
        amount: "50g(2個)",
        },
        {
        name: "ウインナー",
        amount: "50g(3本)",
        },
        {
        name: "玉ねぎ",
        amount: "1/4個",
        },
        {
        name: "ピーマン",
        amount: "1個",
        },
        {
        name: "ケチャップ",
        amount: "大さじ4",
        },
        {
        name: "バター",
        amount: "10g",
        },
        {
        name: "サラダ油",
        amount: "小さじ2",
        }
      ],
      cooking_methods_attributes:[
        {
        cooking_explanation: "ウインナー斜めに断面広く切る",
        step: "1",
        },
        {
        cooking_explanation: "玉ねぎを薄切り",
        step: "2",
        },
        {
        cooking_explanation: "マッシュルーム下の石づきを取り、5ミリ程に薄切り",
        step: "3",
        },
        {
        cooking_explanation: "ピーマンを半分にして中の種を取り、細切り",
        step: "4",
        },
        {
        cooking_explanation: "フライパンでウインナー(焦げが付くまで)→玉ねぎ(しんなりするまで)の順で炒める",
        step: "5",
        },
        {
        cooking_explanation: "ケチャップ・マッシュルームを入れ、弱火で煮詰める",
        step: "6",
        },
        {
        cooking_explanation: "パスタを茹でる(お湯には塩を飲める程度入れる)",
        step: "7",
        },
        {
        cooking_explanation: "パスタは軽く捻って、上の部分を抑えつつ入れる(全て鍋の中へ)",
        step: "8",
        },
        {
        cooking_explanation: "具に火をかけ、バター・ピーマンを後入れ",
        step: "9",
        },
        {
        cooking_explanation: "水気が多少あるくらいで具にパスタを投入",
        step: "10",
        },
        {
        cooking_explanation: "しっかり炒める",
        step: "11",
        },
        {
        cooking_explanation: "盛り付け後粉チーズ・パセリを適量かける",
        step: "12",
        }
      ]
    },

    {
      name: 'チャーハン',
      user_id: 2,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/cha-han.jpeg"), filename:"cha-han.jpeg"),
      serving: 1,
      genre_id: 3,
      recipe_explanation: "お手軽で美味しい！",
      point_explanation: "終始強火！速さが命！油は大胆に使う！",
      tag_ids:[ 1 ],
      ingredients_attributes:[
        {
          name: "卵",
          amount: "2個",
        },
        {
          name: "豚バラ肉",
          amount: "50g",
        },
        {
          name: "長ネギ",
          amount: "5cm",
        },
        {
          name: "生姜",
          amount: "3g",
        },
        {
          name: "米",
          amount: "適量",
        },
        {
          name: "サラダ油",
          amount: "大さじ1と半分",
        },
        {
          name: "塩",
          amount: "小さじ半分",
        },
        {
          name: "味の素",
          amount: "適量(8振り)",
        },
        {
          name: "黒胡椒",
          amount: "適量(思ってる3倍)",
        },
        {
          name: "日本酒",
          amount: "大さじ1",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "生姜をみじん切り",
          step: "1",
        },
        {
          cooking_explanation: "ネギをみじん切り",
          step: "2",
        },
        {
          cooking_explanation: "豚バラ肉を塩で下味つける→米粒くらいの大きさに切る",
          step: "3",
        },
        {
          cooking_explanation: "卵を溶いておく(軽く)",
          step: "4",
        },
        {
          cooking_explanation: "サラダ油をフライパンに大さじ1と半分",
          step: "5",
        },
        {
          cooking_explanation: "豚バラを焦げ目がつく程度まで炒める",
          step: "6",
        },
        {
          cooking_explanation: "肉をフライパンの前隅に寄せ、生姜→卵→米の順に素早く入れる",
          step: "7",
        },
        {
          cooking_explanation: "ご飯を崩すように手早く炒める",
          step: "8",
        },
        {
          cooking_explanation: "塩と味の素を入れて馴染ませる(調味料が固まらないように)",
          step: "9",
        },
        {
          cooking_explanation: "長ネギを入れて軽く火を通す",
          step: "10",
        },
        {
          cooking_explanation: "黒胡椒(思ってる3倍くらい)で馴染ませる",
          step: "11",
        },
        {
          cooking_explanation: "パラっとしたら、日本酒大さじ1を入れる",
          step: "12",
        }
      ]
    },

    {
      name: 'コロッケ',
      user_id: 3,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/korokke.jpeg"), filename:"korokke.jpeg"),
      serving: 1,
      genre_id: 2,
      recipe_explanation: "子供は絶対大好き！",
      point_explanation: "じゃがいもはレンジへ！",
      tag_ids:[ 2, 11 ],
      ingredients_attributes:[
        {
          name: "じゃがいも",
          amount: "300g",
        },
        {
          name: "合い挽き肉",
          amount: "80g",
        },
        {
          name: "玉ねぎ",
          amount: "1/4個",
        },
        {
          name: "バター",
          amount: "15g",
        },
        {
          name: "卵",
          amount: "適量",
        },
        {
          name: "塩胡椒",
          amount: "適量",
        },
        {
          name: "醤油",
          amount: "大さじ1半",
        },
        {
          name: "砂糖",
          amount: "大さじ1",
        },
        {
          name: "味の素",
          amount: "適量(5振り)",
        },
        {
          name: "薄力粉",
          amount: "適量",
        },
        {
          name: "パン粉",
          amount: "適量",
        },
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "じゃがいもの皮を剥く",
          step: "1",
        },
        {
          cooking_explanation: "じゃがいもを一口角に切る",
          step: "2",
        },
        {
          cooking_explanation: "水(大さじ2半)をじゃがいもを入れた容器に入れ、ラップして600Wの6分半レンジで加熱する",
          step: "3",
        },
        {
          cooking_explanation: "蒸している間に玉ねぎをみじん切り",
          step: "4",
        },
        {
          cooking_explanation: "フライパンにバターを投入し、サッと溶かす",
          step: "5",
        },
        {
          cooking_explanation: "合い挽き肉に塩胡椒をして炒める(そこまで香ばしく炒めなくても良い)",
          step: "6",
        },
        {
          cooking_explanation: "フライパンにバターを投入し、サッと溶かす",
          step: "7",
        },
        {
          cooking_explanation: "合い挽き肉に塩胡椒をして炒める(そこまで香ばしく炒めなくても良い)",
          step: "8",
        },
        {
          cooking_explanation: "玉ねぎを投入して炒める",
          step: "9",
        },
        {
          cooking_explanation: "醤油大さじ1半を加える",
          step: "10",
        },
        {
          cooking_explanation: "砂糖大さじ1、味の素5振りを加える",
          step: "11",
        },
        {
          cooking_explanation: "醤油の水分がなくなるまで炒める",
          step: "12",
        },
        {
          cooking_explanation: "加熱したじゃがいもとミンチを混ぜ、よく潰す",
          step: "13",
        },
        {
          cooking_explanation: "人肌くらいの温度になるまで粗熱をとる",
          step: "14",
        },
        {
          cooking_explanation: "四等分にして、コロッケの形に成形する",
          step: "15",
        },
        {
          cooking_explanation: "小麦粉→卵→パン粉の順でつけ衣を作る",
          step: "16",
        },
        {
          cooking_explanation: "弱目の中火で中まで温める感じで揚げ焼きする",
          step: "17",
        },
        {
          cooking_explanation: "いい色に揚げ目がつけばバットにあげる",
          step: "18",
        },
        {
          cooking_explanation: "盛り付け",
          step: "19",
        }
      ]
    },

    {
      name: '肉野菜炒め',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/nikuyasai.jpeg"), filename:"nikuyasai.jpeg"),
      serving: 1,
      genre_id: 2,
      recipe_explanation: "健康的！",
      point_explanation: "材料の火の通り方を熟知すること！",
      tag_ids:[ 2, 5 ],
      ingredients_attributes:[
        {
          name: "キャベツ",
          amount: "120g",
        },
        {
          name: "人参",
          amount: "80g(ヘタなし)",
        },
        {
          name: "ピーマン",
          amount: "3個(50g)",
        },
        {
          name: "もやし",
          amount: "100g",
        },
        {
          name: "豚バラ",
          amount: "150g",
        },
        {
          name: "ニンニク",
          amount: "5g",
        },
        {
          name: "生姜",
          amount: "5g",
        },
        {
          name: "サラダ油",
          amount: "大さじ1",
        },
        {
          name: "塩胡椒",
          amount: "適量",
        },
        {
          name: "塩",
          amount: "小さじ1/3",
        },
        {
          name: "味の素",
          amount: "5振り",
        },
        {
          name: "黒胡椒",
          amount: "適量",
        },
        {
          name: "醤油",
          amount: "小さじ1",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "人参を薄切り",
          step: "1",
        },
        {
          cooking_explanation: "ピーマンを半分に切って、1cm弱で薄切り(種取りは自由)",
          step: "2",
        },
        {
          cooking_explanation: "キャベツをざく切り(芯を取るかは自由)",
          step: "3",
        },
        {
          cooking_explanation: "ニンニクを叩いて潰し、芯を取って粗みじん切り",
          step: "4",
        },
        {
          cooking_explanation: "生姜をスライスして千切り",
          step: "5",
        },
        {
          cooking_explanation: "豚バラを5cm幅で切る(塩胡椒で下味をつけておく)",
          step: "6",
        },
        {
          cooking_explanation: "フライパンにサラダ油大さじ1(強めの中火)",
          step: "7",
        },
        {
          cooking_explanation: "豚バラに焼き目をつけ、フライパンから取り出す",
          step: "8",
        },
        {
          cooking_explanation: "油をそのまま利用し、人参(サッと)→ピーマン(クタッとなるまで)1分〜1分半炒める",
          step: "9",
        },
        {
          cooking_explanation: "キャベツ、ニンニク、生姜を入れて炒める→塩、味の素を入れる",
          step: "10",
        },
        {
          cooking_explanation: "step10で1分程炒めたらもやしを入れる(サッと10秒炒める)",
          step: "11",
        },
        {
          cooking_explanation: "豚バラ→醤油→黒胡椒(思ってる3倍)の順に入れ、炒めて完成",
          step: "12",
        }
      ]
    },

    {
      name: '筑前煮',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tikuzenni.jpeg"), filename:"tikuzenni.jpeg"),
      serving: 5,
      genre_id: 2,
      recipe_explanation: "懐かしの味。。。",
      point_explanation: "こんにゃくは包丁ではなく、手でちぎると味が染みる！",
      tag_ids:[ 5, 9 ],
      ingredients_attributes:[
        {
          name: "鶏もも肉",
          amount: "2枚",
        },
        {
          name: "こんにゃく",
          amount: "1枚",
        },
        {
          name: "レンコン",
          amount: "200g",
        },
        {
          name: "タケノコの水煮",
          amount: "1/2本",
        },
        {
          name: "人参",
          amount: "小1本",
        },
        {
          name: "じゃがいも",
          amount: "中2個",
        },
        {
          name: "油揚げ",
          amount: "3枚",
        },
        {
          name: "干し椎茸",
          amount: "4枚",
        },
        {
          name: "砂糖",
          amount: "大3",
        },
        {
          name: "料理酒",
          amount: "大3",
        },
        {
          name: "醤油",
          amount: "大2",
        },
        {
          name: "鰹だし",
          amount: "大1",
        },
        {
          name: "みりん",
          amount: "大3",
        },
        {
          name: "四角豆",
          amount: "大1本",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "干し椎茸をギリギリ浸る程度にぬるま湯につけて戻しておく",
          step: "1",
        },
        {
          cooking_explanation: "鶏肉、こんにゃく、タケノコの水煮、人参、じゃがいも、油揚げをだいたい同じくらいの大きさの一口大に切る",
          step: "2",
        },
        {
          cooking_explanation: "切った鶏肉に砂糖、料理酒、醤油をもみ込む",
          step: "3",
        },
        {
          cooking_explanation: "深めの鍋に油をしき、step3のものを入れ、鶏肉の表面の色が変わるまで炒める(鶏肉に濃い味をつける)",
          step: "4",
        },
        {
          cooking_explanation: "鶏肉、こんにゃく、タケノコの水煮、人参、じゃがいも、油揚げを入れ、混ぜ合わせる",
          step: "5",
        },
        {
          cooking_explanation: "戻した干し椎茸を軽く絞り、一口大に切る(戻し汁も使うので捨てない)",
          step: "6",
        },
        {
          cooking_explanation: "鍋に切った干し椎茸と鰹だし、みりん、料理酒、醤油と椎茸の戻し汁を100mlほど入れる",
          step: "7",
        },
        {
          cooking_explanation: "軽く混ぜ合わせながら柔らかくなるまで煮込む(中火～弱火)",
          step: "8",
        },
        {
          cooking_explanation: "最後に一口大に切った四角豆を入れて軽く混ぜ合わせて完成",
          step: "9",
        }
      ]
    },

    {
      name: '鰹のフライ',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/fish.jpeg"), filename:"fish.jpeg"),
      serving: 2,
      genre_id: 2,
      recipe_explanation: "簡単でサクサク",
      point_explanation: "鰹を油に入れた後は、まず触らずに揚げる",
      tag_ids:[ 3, 11 ],
      ingredients_attributes:[
        {
          name: "鰹のたたき",
          amount: "1本",
        },
        {
          name: "薄力粉(まぶす用)",
          amount: "大さじ1",
        },
        {
          name: "薄力粉(衣用)",
          amount: "大さじ5",
        },
        {
          name: "水",
          amount: "大さじ5",
        },
        {
          name: "マヨネーズ",
          amount: "大さじ1",
        },
        {
          name: "粗挽き黒胡椒",
          amount: "適量",
        },
        {
          name: "パン粉",
          amount: "1.5カップ",
        },
        {
          name: "揚げ油",
          amount: "適量",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "鰹のたたきは1.5cmの厚さに切っておく",
          step: "1",
        },
        {
          cooking_explanation: "薄力粉・マヨネーズ・粗挽き黒胡椒・水をボウルに入れてよく混ぜる",
          step: "2",
        },
        {
          cooking_explanation: "step2に鰹をつけて、パン粉をまぶし、手で挟んで包みパン粉をしっかりとつける",
          step: "3",
        },
        {
          cooking_explanation: "深めのフライパンに揚げ油を2cmの深さになるまで入れて、中火にかけて3分ほど油を温める",
          step: "4",
        },
        {
          cooking_explanation: "衣をつけた鰹を油にそっといれて、触らずに1分30秒揚げたら裏返してさらに1分30秒揚げて、きつね色になったら完成",
          step: "5",
        }
      ]
    },

    {
      name: '冷凍ハンバーグでの串料理',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kushi.jpeg"), filename:"kushi.jpeg"),
      serving: 3,
      genre_id: 1,
      recipe_explanation: "どんなものにも合う！",
      point_explanation: "ハンバーグの種が崩れないようにしっかり焼くのがコツ",
      tag_ids:[ 2, 7 ],
      ingredients_attributes:[
        {
          name: "冷凍ハンバーグ",
          amount: "150ｇ",
        },
        {
          name: "串",
          amount: "適量",
        },
        {
          name: "油",
          amount: "適量",
        },
        {
          name: "パン粉",
          amount: "適量",
        },
        {
          name: "卵",
          amount: "2個",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "冷凍保存しているハンバーグを一口サイズに切る",
          step: "1",
        },
        {
          cooking_explanation: "カットしたハンバーグを解凍(ハンバーグは一度焼かれているもの)",
          step: "2",
        },
        {
          cooking_explanation: "解凍し終わったハンバーグに衣をつけて、160℃の油でこんがり揚げる",
          step: "3",
        },
        {
          cooking_explanation: "串に刺して完成",
          step: "4",
        }
      ]
    },

    {
      name: '親子丼',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/don.jpeg"), filename:"don.jpeg"),
      serving: 2,
      genre_id: 2,
      recipe_explanation: "みんな大好き!",
      point_explanation: "卵はふんわりと！",
      tag_ids:[ 1, 10 ],
      ingredients_attributes:[
        {
          name: "鶏もも肉",
          amount: "1枚(200g)",
        },
        {
          name: "塩麹",
          amount: "大さじ1",
        },
        {
          name: "玉ねぎ",
          amount: "1/2個",
        },
        {
          name: "三つ葉",
          amount: "2束",
        },
        {
          name: "出汁",
          amount: "150cc",
        },
        {
          name: "塩麹",
          amount: "小さじ2",
        },
        {
          name: "砂糖",
          amount: "小さじ1/2",
        },
        {
          name: "ごはん",
          amount: "2膳分",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "鶏肉は大きめの一口大にきり、塩麹で下味をつける",
          step: "1",
        },
        {
          cooking_explanation: "玉ねぎを薄切りにする",
          step: "2",
        },
        {
          cooking_explanation: "三つ葉は1.5cm長さにざく切りにし、水にさらす",
          step: "3",
        },
        {
          cooking_explanation: "出汁、塩麹、砂糖をフライパンに加えて煮る",
          step: "4",
        },
        {
          cooking_explanation: "煮立ってきたら、鶏肉半量を加える",
          step: "5",
        },
        {
          cooking_explanation: "玉ねぎも半量加え、弱めの中火にし蓋をしてしっかり鶏肉に火をとおす",
          step: "6",
        },
        {
          cooking_explanation: "step6の卵を回し入れ",
          step: "7",
        },
        {
          cooking_explanation: "三つ葉も半量加え、蓋をして火を止め、2-3分蒸らす",
          step: "8",
        },
        {
          cooking_explanation: "ごはんを盛った上にstep11のものを滑らせながら盛って完成",
          step: "9",
        }
      ]
    },

    {
      name: 'しっとり甘めのスイートポテト',
      user_id: 2,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/poteto.jpeg"), filename:"poteto.jpeg"),
      serving: 5,
      genre_id: 1,
      recipe_explanation: "しっとり美味しく簡単にできる！",
      point_explanation: "よく混ぜ合わせること！",
      tag_ids:[ 6 ],
      ingredients_attributes:[
        {
          name: "さつまいも",
          amount: "正味500g",
        },
        {
          name: "マーガリン",
          amount: "50g",
        },
        {
          name: "グラニュー糖",
          amount: "80g",
        },
        {
          name: "牛乳",
          amount: "75g",
        },
        {
          name: "ケーキシロップ",
          amount: "大さじ1〜2",
        },
        {
          name: "塩",
          amount: "少々",
        },
        {
          name: "バニラオイル",
          amount: "適量",
        },
        {
          name: "ブランデー",
          amount: "7〜8g",
        },
        {
          name: "卵黄",
          amount: "1個",
        },
        {
          name: "つや出し用卵黄",
          amount: "1個",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "さつまいもは蒸して皮を取り除きマッシュし鍋に入れる",
          step: "1",
        },
        {
          cooking_explanation: "step1に材料のマーガリンからバニラオイルまでを上から順番に加えてその都度ゴムベラ等でよく混ぜ合わせる",
          step: "2",
        },
        {
          cooking_explanation: "step2を火にかけて混ぜ合わせながら弱火で練る",
          step: "3",
        },
        {
          cooking_explanation: "step3に卵黄、ブランデーを加えてよく混ぜ合わせる",
          step: "4",
        },
        {
          cooking_explanation: "天板にシリコン製の耐熱シートを敷き、スプーンとバターナイフ等で生地を形作りながら天板に並べる",
          step: "5",
        },
        {
          cooking_explanation: "step5に刷毛やスプーンで卵黄を塗る",
          step: "6",
        },
        {
          cooking_explanation: "予熱180度20分〜25分オーブンチン！キレイな焼き色が付いたら完成",
          step: "7",
        }
      ]
    },

    {
      name: 'だし巻き卵',
      user_id: 1,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/dashimaki.jpeg"), filename:"dashimaki.jpeg"),
      serving: 2,
      genre_id: 2,
      recipe_explanation: "柔らかく旨味がある！",
      point_explanation: "しっかりめの味付けにする！",
      tag_ids:[ 13 ],
      ingredients_attributes:[
        {
          name: "卵",
          amount: "3個",
        },
        {
          name: "めんつゆ（2倍濃縮）",
          amount: "大さじ1.5",
        },
        {
          name: "だし汁（又は水）",
          amount: "大さじ1.5",
        },
        {
          name: "こめ油（又はサラダ油）",
          amount: "適量",
        }
      ],
      cooking_methods_attributes:[
        {
          cooking_explanation: "ボウルに卵を加えてよく溶き、白身は箸で持ち上げる様にして切る",
          step: "1",
        },
        {
          cooking_explanation: "めんつゆ・だし汁を加えて混ぜ合わせる",
          step: "2",
        },
        {
          cooking_explanation: "卵焼き器をしっかりと熱し、油を敷く",
          step: "3",
        },
        {
          cooking_explanation: "強めの弱火にしてstep1,2で作ったものをを1/4量流し入れる",
          step: "4",
        },
        {
          cooking_explanation: "奥から手前に巻いていき、奥に寄せる",
          step: "5",
        },
        {
          cooking_explanation: "薄く油を敷き、step1,2で作ったものの1/4量を流し入れ（奥の卵焼きの下にも流し込む）、手前に巻いていくのを2回繰り返す",
          step: "6",
        },
        {
          cooking_explanation: "卵焼きを取り出し、粗熱が取れたら切り分ける",
          step: "7",
        }
      ]
    }
  ]
)
