module UsersHelper
  def user_avatar(user)
    if user.avatar.attached?
      image_tag(rails_blob_path(user.avatar, only_path: true),
                style: "width: 200px; height: 200px; border-radius: 50%; object-fit: cover;
                        border: 5px solid white; box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);")
    else
      placeholder_image = case user.gender
                          when 'male' then 'admin_user/male_avatar'
                          when 'female' then 'admin_user/female_avatar'
                          end

      image_tag(placeholder_image,
                style: "width: 200px; height: 200px; border-radius: 50%; object-fit: cover;
                        border: 5px solid white; box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);")
    end
  end
end
