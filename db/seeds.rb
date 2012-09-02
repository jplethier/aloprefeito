# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





  a = Complaint.create(
      :title => "Rua esburacada!",
      :description => "A minha rua ta cheia de buraco, absurdo isso!",
      :anonymous => true, :resolved => false)

  a.attachments.create(:url => "www.urllongapracarambaparavercomovaificarnatela.com",
                       :attachment_type => Attachment::TYPES[:font]
  )
  a.attachments.create(:latitude => "-22.9", :longitude => "-43.3", :city => "Rio de Janeiro",
                       :attachment_type => Attachment::TYPES[:map]
  )

  b = Complaint.create(
      :title => "Predio desabando.",
      :description => "Estamos correndo serios riscos de vida na rua tal tal, tem um predio velho pra cacete que esta muito perto de desabar
                        gostaria de saber se existe alguma previsao para conserto do mesmo.",
      :anonymous => true, :resolved => false)

  b.attachments.create(:url => "www.urllongapracarambaparavercomovaificarnatela.com",
                       :attachment_type => Attachment::TYPES[:font])

  b.attachments.create(:latitude => "-22.4593", :longitude => "-45.95239", :attachment_type => Attachment::TYPES[:map])

  c = Complaint.create(
      :title => "Propaganda eleitorial em lugar proibido",
      :description => "Pode isso, Arnaldo?. Update: FOI RESOLVIDO!! AEEE!",
      :anonymous => true, :resolved => true)

  c.attachments.create(:url => "www.podeisso.com",
                       :attachment_type => Attachment::TYPES[:font]
  )
  c.attachments.create(:latitude => "-25.9", :longitude => "-33.3", :city => "Rio de Janeiro",
                       :attachment_type => Attachment::TYPES[:map]
  )


  d = Complaint.create(
      :title => "Politico prometeu e nao cumpriu",
      :description => "Disse que ia fazer e nao fez! Vejam o video no embed.",
      :anonymous => true, :resolved => false)

  d.attachments.create(:url => "http://www.youtube.com/watch?v=zAr2pzB-BU4",
                       :attachment_type => Attachment::TYPES[:embed]
  )
  d.attachments.create(:latitude => "-20.1", :longitude => "-49.3", :city => "Rio de Janeiro",
                       :attachment_type => Attachment::TYPES[:map]
  )


