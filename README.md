# テーブル設計

# usersテーブル

| Column             | Type      | Options      |
| ------------------ | --------- | -------------|
| nickname           | string    | null: false  |
| email              | string    | unique: true |
| encrypted_password | string    | null: false  |

### Association

- has_many :items
- has_many :comments
- has_many :likes

# itemsテーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ------------------|
| name               | string     | null: false       |
| price              | integer    |                   |
| information        | string     |                   |
| category_id        | integer    | null: false       |
| brand              |            |                   |
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