module UsersHelper
  #引数で与えられたユーザーのGravatar画像を返す。
  def gravatar_for(user, size: 80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)#gravatarと対応するよう、メアドををハッシュ化して保存
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
