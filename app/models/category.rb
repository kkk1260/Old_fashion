class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'トップス' },
    { id: 3, name: 'ジャケット/アウター' },
    { id: 4, name: 'パンツ' },
    { id: 5, name: '靴' },
    { id: 6, name: 'バッグ' },
    { id: 7, name: 'スーツ' },
    { id: 8, name: '帽子' },
    { id: 9, name: 'アクセサリー' },
    { id: 10, name: '小物' }
  ]

  include ActiveHash::Associations
  has_many :items
end
