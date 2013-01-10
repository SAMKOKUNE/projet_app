namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

      75.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    # Les auteurs des utilisateurs
    users = User.all(limit: 6)
    15.times do
      nom = Faker::Name.last_name
      prenom =Faker::Name.first_name
      users.each { |user| user.authors.create!(nom: nom,prenom: prenom) }
    end
    # Les publications des auteurs
    10.times do
      titre = Faker::Name.title
      typePublication= "type de publication"
      nom= "Mes ouvrages"
      annee= "1988"
      mois= "Janvier"
      pages= "30"
      notes= "Mes notes"
      resume= "Ma vie"
      Publication.create!(titre: titre,typePublication: typePublication,nom: nom,annee: annee,mois: mois,pages: pages,notes: notes, resume: resume)
    end
    # Les relations entre publications et auteurs
    authors=Author.all
    publications=Publication.all
    author=authors.first
    publications.each{|publication| author.have!(publication)}
    authors.each{|auteur| auteur.have!(author)}

  end
end
