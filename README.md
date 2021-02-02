# テーブル設計

# usersテーブル

| Column             | Type      | Options      |
| ------------------ | --------- | -------------|
| email              | string    | unique: true |
| encrypted_password | string    | null: false  |

### Association

- has_many :items
- has_many :comments
- has_many :likes

# profileテーブル

| Column             | Type      | Options      |
| ------------------ | --------- | -------------|
| name               | string    |
| encrypted_password | string    | null: false  |

### Association

- belongs_to :user

# itemsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ------------------|
| name               | string     | null: false       |
| information        | text       |                   |
| category_id        | integer    | null: false       |
| brand              | string     |                   |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :likes

# commentsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| text               | string     |                   |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

# likesテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

- belongs_to :user
- belongs_tp :item


# 各種機能&導入技術
• エラー文の日本語変換(rails-i18n)
• テスト（Rspec,Capybara,factory_bot）
• 画像アップロード (active_storage,mini_magick,image_processing)
• 