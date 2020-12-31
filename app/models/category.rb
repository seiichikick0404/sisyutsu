class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食費' },
    { id: 3, name: '日用雑貨' },
    { id: 4, name: '交通' },
    { id: 5, name: '通信' },
    { id: 6, name: '水道・光熱' },
    { id: 7, name: '住まい' },
    { id: 8, name: 'その他雑費' }
  ]
 
end