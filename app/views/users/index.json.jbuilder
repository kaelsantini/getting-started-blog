json.users @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.birth_date user.birth_date
  json.gender user.gender
end
