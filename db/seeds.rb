# User.create([
#     { name: 'テストユーザー' },
#     { email: 'hayashideveloper@gmail.com' },
#     { password_digest: '12345678' },
#     { unique_id: '@test_user' }
# ])

Tag.create([
    { name: 'プロテイン', sort: 1 },
    { name: 'ダイエット', sort: 2 },
    { name: '健康', sort: 3 },
    { name: '美容', sort: 4 },
    { name: '疲労回復', sort: 5 },
    { name: '集中力UP', sort: 6 },
    { name: 'その他', sort: 100 }
])