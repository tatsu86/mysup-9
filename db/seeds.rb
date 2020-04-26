User.create!([
    { 
        name: 'テストユーザー',
        email: 'hayashideveloper@gmail.com',
        password: 'password',
        unique_id: 'test_user',
        introduction: 'これはテスト用のアカウントです。',
        birthday: '1996-08-06',
        sex: 1,
        image: open("#{Rails.root}/db/fixtures/PersonalTraning.jpg"),
        favorite1: 'マイプロテインの「Impact Whey Protein」ナチュラルチョコレート味',
        favorite2: 'マイプロテインのカフェイン'
    },
    { 
        name: '笹崎 まみ',
        email: 'sasazaki@gmail.com',
        password: 'password',
        unique_id: 'sasazaki',
        introduction: '音楽活動をしています',
        birthday: '1990-05-21',
        sex: 2,
        image: open("#{Rails.root}/db/fixtures/kimono.jpg"),
        favorite1: ''
    },
    { 
        name: '織部 里沙',
        email: 'oribe@gmail.com',
        password: 'password',
        unique_id: 'oribe',
        introduction: 'キックボクシングをしています',
        birthday: '1987-06-24',
        sex: 2,
        image: open("#{Rails.root}/db/fixtures/LadiesBack.jpg"),
        favorite1: 'DHCのプロテイン'
    },
    { 
        name: '佐々木 史郎',
        email: 'sasaki@gmail.com',
        password: 'password',
        unique_id: 'sasaki',
        introduction: 'ボクシングをしています',
        birthday: '1990-06-04',
        sex: 1,
        favorite1: 'ZAVASのプロテイン'
    },
])

Tag.create!([
    { name: 'プロテイン', sort: 1 },
    { name: 'ダイエット', sort: 2 },
    { name: '健康', sort: 3 },
    { name: '美容', sort: 4 },
    { name: '疲労回復', sort: 5 },
    { name: '集中力UP', sort: 6 },
    { name: 'その他', sort: 100 },
])

Post.create!([
    { 
        body: 'マイプロテインのImpact Wheyのナチュラルチョコレート味は安定の美味しさ。安いから買ってみて！',
        image: open("#{Rails.root}/db/fixtures/protein.jpg"),
        user_id: 1,
        evaluation: 4
    },
    { 
        body: 'ちょっと甘すぎるかな。甘党の人には良いかも。',
        image: open("#{Rails.root}/db/fixtures/chocolate.jpg"),
        user_id: 1,
        evaluation: 2
    },
    { 
        body: 'マイプロテインの抹茶味激ウマ！！',
        user_id: 2,
        evaluation: 5
    },
    { 
        body: 'NOWのBCAAはカプセルが大きくて喉に引っかかりそう。でも、コスパを考えれば悪くないかな。。',
        user_id: 3,
        evaluation: 2
    },
    { 
        body: 'Kentaiのダイエットプロテインは結構飲みやすかった',
        user_id: 4,
        evaluation: 3
    },
])

Like.create!([
    {
        post_id: 1,
        user_id: 2,
    },
    {
        post_id: 1,
        user_id: 4,
    },
    {
        post_id: 2,
        user_id: 3,
    },
    {
        post_id: 3,
        user_id: 1,
    },
    {
        post_id: 5,
        user_id: 2,
    },
])

Comment.create!([
    {
        post_id: 1,
        user_id: 2,
        unique_id: 'sasazaki',
        comment: '私も同じの飲んだことあります！美味しいですよね。',
    },
    {
        post_id: 1,
        user_id: 4,
        unique_id: 'sasaki',
        comment: '最近テレビでやってた商品ですよね！',
    },
])

Relationship.create!([
    {
        user_id: 1,
        follow_id: 2,
    },
    {
        user_id: 1,
        follow_id: 3,
    },
    {
        user_id: 1,
        follow_id: 4,
    },
    {
        user_id: 2,
        follow_id: 1,
    },
    {
        user_id: 2,
        follow_id: 3,
    },
    {
        user_id: 3,
        follow_id: 1,
    },
    {
        user_id: 4,
        follow_id: 3,
    },
])