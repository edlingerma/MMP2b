User.create([
                      { name: 'Sepp', username: 'sefop174', password: 'sepp', password_confirmation: 'sepp' },
                      { name: 'maria', username: 'maria', password: 'maria', password_confirmation: 'maria' },
                      { name: 'Claire Curtis', username: 'claireToGO', password: 'claire', password_confirmation: 'claire' },
                      { name: 'Peter', username: 'the_machine', password: 'peter', password_confirmation: 'peter' },
                      { name: 'Alice Moore', username: 'alice39', password: 'alice', password_confirmation: 'alice' }
                    ])

Challenge.create([
                                { title: 'Laufgruppe Elsbethen', description: 'Wir sind auch in Zeiten von Corona für euch da!', owner: User.find(4) },
                                { title: 'Taekwondo Anif', description: '', owner: User.find(1) },
                                { title: 'Sports Salzburg', description: 'Everyone is welcome!', owner: User.find(5) }
                              ])

Challenge.find(1).avatar.attach(io: File.open('storage/seed1.jpg'), filename: 'seed1.jpg')
Challenge.find(2).avatar.attach(io: File.open('storage/seed2.jpg'), filename: 'seed2.jpg')
Challenge.find(3).avatar.attach(io: File.open('storage/seed3.jpg'), filename: 'seed3.jpg')

Request.create([{ user: User.find(4), challenge: Challenge.find(1), confirmed: true },
                { user: User.find(1), challenge: Challenge.find(2), confirmed: true },
                { user: User.find(5), challenge: Challenge.find(3), confirmed: true },
                { user: User.find(2), challenge: Challenge.find(1), confirmed: true },
                { user: User.find(2), challenge: Challenge.find(2), confirmed: true },
                { user: User.find(3), challenge: Challenge.find(3), confirmed: true },
                { user: User.find(2), challenge: Challenge.find(3) },
                { user: User.find(1), challenge: Challenge.find(3) },
                { user: User.find(3), challenge: Challenge.find(2) },
                { user: User.find(3), challenge: Challenge.find(1) },
                { user: User.find(5), challenge: Challenge.find(1) },
                { user: User.find(5), challenge: Challenge.find(2) }
               ])

Activity.create([
                               { title: 'Liegestütz', description: 'Dabei nicht durchhängen!', goal: 500, unit: 'km', challenge: Challenge.find(1) },
                               { title: 'Kniebeuge', description: '', goal: 1000, unit: '', challenge: Challenge.find(1)  },
                               { title: 'Handstand', description: 'für die Profis unter euch', goal: 60, unit: 'min', challenge: Challenge.find(1) },
                               { title: 'Laufen', description: 'nicht zu schnell', goal: 1000, unit: 'km', challenge: Challenge.find(1) },

                               { title: 'Kniebeuge', description: 'Zum Aufwärmen', goal: 2000, unit: '', challenge: Challenge.find(2) },
                               { title: 'Dehnen', description: 'Auf gesundes Dehnen achten!', goal: 1000, unit: 'min', challenge: Challenge.find(2) },
                               { title: 'Laufen', description: 'Danach gleich dehnen', goal: 1000, unit: 'km', challenge: Challenge.find(2) },
                               { title: 'Dwi-Chagi', description: 'optional ohne Festhalten', goal: 1000, unit: '', challenge: Challenge.find(2) },
                               { title: 'Yop-Chagi', description: 'optional ohne Festhalten', goal: 1000, unit: 'km', challenge: Challenge.find(2) },

                               { title: 'Push-Ups', description: 'nice and slow!', goal: 500, unit: '', challenge: Challenge.find(3) },
                               { title: 'Running', description: '', goal: 500, unit: 'km', challenge: Challenge.find(3) },
                               { title: 'Squats', description: '', goal: 1000, unit: '', challenge: Challenge.find(3) },

                             ])
Entry.create([
                         { amount: 50, activity: Activity.find(1), user: User.find(2) },
                         { amount: 40, activity: Activity.find(1), user: User.find(2) },
                         { amount: 60, activity: Activity.find(1), user: User.find(2) },
                         { amount: 20, activity: Activity.find(1), user: User.find(4) },
                         { amount: 30, activity: Activity.find(1), user: User.find(4) },
                         { amount: 120, activity: Activity.find(2), user: User.find(2) },
                         { amount: 100, activity: Activity.find(2), user: User.find(2) },
                         { amount: 100, activity: Activity.find(2), user: User.find(2) },
                         { amount: 120, activity: Activity.find(2), user: User.find(2) },
                         { amount: 120, activity: Activity.find(2), user: User.find(4) },
                         { amount: 75, activity: Activity.find(2), user: User.find(4) },
                         { amount: 150, activity: Activity.find(2), user: User.find(4) },
                         { amount: 150, activity: Activity.find(3), user: User.find(4) },
                         { amount: 100, activity: Activity.find(3), user: User.find(2) },
                         { amount: 80, activity: Activity.find(3), user: User.find(2) },
                         { amount: 80, activity: Activity.find(3), user: User.find(4) },
                         { amount: 120, activity: Activity.find(3), user: User.find(4) },

                         { amount: 200, activity: Activity.find(4), user: User.find(1) },
                         { amount: 300, activity: Activity.find(4), user: User.find(1) },
                         { amount: 220, activity: Activity.find(4), user: User.find(1) },
                         { amount: 140, activity: Activity.find(4), user: User.find(2) },
                         { amount: 30, activity: Activity.find(4), user: User.find(2) },
                         { amount: 30, activity: Activity.find(5), user: User.find(2) },
                         { amount: 20, activity: Activity.find(5), user: User.find(1) },
                         { amount: 20, activity: Activity.find(5), user: User.find(1) },
                         { amount: 20, activity: Activity.find(6), user: User.find(1) },
                         { amount: 20, activity: Activity.find(6), user: User.find(1) },
                         { amount: 15, activity: Activity.find(6), user: User.find(1) },
                         { amount: 15, activity: Activity.find(6), user: User.find(2) },
                         { amount: 15, activity: Activity.find(6), user: User.find(2) },
                         { amount: 20, activity: Activity.find(6), user: User.find(2) },
                         { amount: 20, activity: Activity.find(6), user: User.find(2) },
                         { amount: 20, activity: Activity.find(6), user: User.find(2) },
                         { amount: 35, activity: Activity.find(6), user: User.find(2) },
                         { amount: 25, activity: Activity.find(6), user: User.find(2) },
                         { amount: 15, activity: Activity.find(6), user: User.find(2) },
                         { amount: 10, activity: Activity.find(6), user: User.find(2) },
                         { amount: 20, activity: Activity.find(6), user: User.find(2) },

                         { amount: 100, activity: Activity.find(7), user: User.find(2) },
                         { amount: 50, activity: Activity.find(7), user: User.find(2) },
                         { amount: 40, activity: Activity.find(7), user: User.find(2) },
                         { amount: 70, activity: Activity.find(7), user: User.find(2) },
                         { amount: 70, activity: Activity.find(7), user: User.find(1) },
                         { amount: 30, activity: Activity.find(7), user: User.find(1) },
                         { amount: 100, activity: Activity.find(7), user: User.find(1) },
                         { amount: 60, activity: Activity.find(7), user: User.find(1) },
                         { amount: 70, activity: Activity.find(7), user: User.find(1) },
                         { amount: 100, activity: Activity.find(7), user: User.find(1) },
                         { amount: 30, activity: Activity.find(7), user: User.find(1) },
                         { amount: 50, activity: Activity.find(7), user: User.find(1) },

                         { amount: 50, activity: Activity.find(8), user: User.find(1) },
                         { amount: 20, activity: Activity.find(8), user: User.find(1) },
                         { amount: 10, activity: Activity.find(8), user: User.find(1) },
                         { amount: 30, activity: Activity.find(8), user: User.find(2) },
                         { amount: 40, activity: Activity.find(8), user: User.find(2) },
                         { amount: 40, activity: Activity.find(8), user: User.find(2) },

                         { amount: 40, activity: Activity.find(9), user: User.find(2) },
                         { amount: 20, activity: Activity.find(9), user: User.find(2) },
                         { amount: 10, activity: Activity.find(9), user: User.find(2) },
                         { amount: 30, activity: Activity.find(9), user: User.find(2) },
                         { amount: 30, activity: Activity.find(9), user: User.find(1) },
                         { amount: 50, activity: Activity.find(9), user: User.find(1) },
                         { amount: 60, activity: Activity.find(9), user: User.find(1) },

                         { amount: 60, activity: Activity.find(10), user: User.find(5) },
                         { amount: 100, activity: Activity.find(10), user: User.find(5) },
                         { amount: 200, activity: Activity.find(10), user: User.find(3) },
                         { amount: 100, activity: Activity.find(10), user: User.find(3) },
                         { amount: 50, activity: Activity.find(11), user: User.find(3) },
                         { amount: 40, activity: Activity.find(11), user: User.find(3) },
                         { amount: 70, activity: Activity.find(11), user: User.find(3) },
                         { amount: 70, activity: Activity.find(11), user: User.find(5) },
                         { amount: 20, activity: Activity.find(11), user: User.find(5) },
                         { amount: 100, activity: Activity.find(12), user: User.find(5) },
                         { amount: 120, activity: Activity.find(12), user: User.find(5) },
                         { amount: 70, activity: Activity.find(12), user: User.find(5) },
                         { amount: 50, activity: Activity.find(12), user: User.find(3) },
                         { amount: 30, activity: Activity.find(12), user: User.find(3) },
                         { amount: 100, activity: Activity.find(12), user: User.find(3) },
                         { amount: 120, activity: Activity.find(12), user: User.find(3) },
                       ])