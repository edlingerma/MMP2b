# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
users = User.create([
                      { name: 'maria', username: 'maria', password: 'maria', password_confirmation: 'maria' },
                      { name: 'testperson', username: 'testperson', password: 'testperson', password_confirmation: 'testperson' }
                    ])

challenges = Challenge.create([
                                { title: 'Star Wars', description: 'test test test', owner: users.first },
                                { title: 'Lord of the Rings', description: 'description2', owner: users.last }
                              ])

request = Request.create([{ user: users.first, challenge: challenges.first, confirmed: true },
                          { user: users.last, challenge: challenges.last, confirmed: true },
                          { user: users.first, challenge: challenges.last },
                          { user: users.last, challenge: challenges.first }])
activities = Activity.create([
                               { title: 'super activity', description: 'bla bla', goal: 1000, unit: 'km', challenge_id: challenges.first.id },
                               { title: 'super activity 2', description: 'bla bla 2', goal: 500, unit: 'km', challenge_id: challenges.first.id  },
                               { title: 'super activity 3', description: 'bla bla 3', goal: 1000, unit: 'km', challenge_id: challenges.last.id  }
                             ])
entries = Entry.create([
                         { amount: 50, activity: activities.first, user: users.first },
                         { amount: 20, activity: activities.first, user: users.first },
                         { amount: 100, activity: activities.last, user: users.last }
                       ])
