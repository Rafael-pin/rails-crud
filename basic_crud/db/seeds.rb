10.times do

    Proposal.create({
        name: Faker::Company.name,
        description: Faker::Music.album,
        value: Faker::Number.decimal(l_digits: 2),
        start_date: Faker::Date.backward(days: 100),
        end_date: Faker::Date.forward(days: 100),
    })

end