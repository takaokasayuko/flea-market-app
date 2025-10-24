# 親カテゴリ
food = Category.create!(name: '食品')
fashion = Category.create!(name: 'ファッション')
electronics = Category.create!(name: '家電')
# 中分類
food.children.create!([
  { name: 'お菓子' },
  { name: '肉' }
])
fashion.children.create!([
  { name: 'メンズ' },
  { name: 'レディース' }
])
electronics.children.create!([
  { name: 'テレビ' },
  { name: 'パソコン' }
])
# 小分類
Category.find_by(name: 'お菓子').children.create!([
  { name: 'チョコレート' },
  { name: 'スナック菓子' },
  { name: 'キャンディ' }
])
Category.find_by(name: '肉').children.create!([
  { name: '牛肉' },
  { name: '豚肉' },
  { name: '鶏肉' }
])

# 商品状態
Status.create!([
  { name: '新品・未使用' },
  { name: '良好' },
  { name: '傷や汚れあり' },
  { name: '状態が悪い' }
])

# ユーザー
10.times do |n|
  User.create!(email: "example-#{n+1}@example.com",
                password: "12345678")
end

# 出品商品
categories = Category.pluck(:id)
statuses = Status.pluck(:id)
detail = Faker::Lorem.paragraph(sentence_count: 5)
image_paths = [
  Rails.root.join("db/images/sample1.jpg"),
  Rails.root.join("db/images/sample2.jpg"),
  Rails.root.join("db/images/sample3.jpg"),
  Rails.root.join("db/images/sample4.jpg"),
  Rails.root.join("db/images/sample5.jpg")
]

30.times do |n|
  category_id = categories[n % categories.size]
  status_id = statuses[n % statuses.size]

  product = Product.create!(
  name: "商品#{n+1}",
  user: User.first,
  category_id: category_id,
  status_id: status_id,
  detail: detail,
  price: rand(500..10000)
  )

  image_path = image_paths[n % 5]
  product.image.attach(
    io: File.open(image_path),
    filename: File.basename(image_path)
  )
end
