10.times do |i|
  Company.create name: FFaker::Company.name
end

10.times do |i|
  Company.create name: FFaker::Company.name,
    director_attributes: {name: FFaker::Name.name}
end

### HAS ONE ###

# CREATE
# company = Company.create name: FFaker::Company.name, director_attributes: {name: FFaker::Name.name}

# UPDATE

# update_only: false (default)

  # NO ID (destroy + create)
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {name: FFaker::Name.name}

  # ID (update)
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {id: 10, name: FFaker::Name.name}

# update_only: true

  # NO ID (update)
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {name: FFaker::Name.name}

  # NO ID (update)
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {id: 10, name: FFaker::Name.name}

# DESTROY

# allow_destroy: false (default)

  # update company only, don't destroy director
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {id: 10, _destroy: true}

# allow_destroy: true

  # update company only and destroy director
  # company = Company.last
  # company.update_attributes name: FFaker::Company.name, director_attributes: {id: 10, _destroy: true}
