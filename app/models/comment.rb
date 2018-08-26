class Comment < ActiveRecord::Base
  belongs_to :brog               #tweetsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
