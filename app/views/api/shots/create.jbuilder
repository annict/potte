json.thumbnail do
  image = @shot.image.thumb('400x400#n')
  json.url image.url
end
