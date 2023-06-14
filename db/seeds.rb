KEY = "vEqmPDsSQJqKTpaOjrbwVg==88FJhtYQjvhNTufV"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
require 'json'
require 'rest-client'

EXERCICES = []
header = ["name", "nature", "muscle", "equipment", "instructions"]
# csv_path = File.join(__dir__, 'exercices.csv')


# CLEARING DB
WorkoutSet.destroy_all
puts "All Workouts deleted (WorkoutSets deleted too)"
Exercice.destroy_all
puts "All Exercices deleted"
Workout.destroy_all
User.destroy_all
puts "All Users deleted"



# CREATING USERS
15.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "azerty"
  )
  user.save
end
USERS = User.all
puts "#{User.count} users added"


# LOAD EXERICES FROM THE CSV FILE
# CSV.foreach(csv_path, headers: :first_row, col_sep: '//', header_converters: :symbol) do |row|
#   if Exercice.where(name: row[:name]).empty?
#     exo = Exercice.new(row)
#     exo.user = USERS.sample
#     exo.save
#     EXERCICES << exo
#   end
# end
# puts "#{Exercice.count} exercices loaded from CSV"

# ADD NON ALREADY EXISTANT EXERCICE IN EXERCICE DB
# def query_new_exercices(option, section)
#   new_exercices = 0
#   url = "https://api.api-ninjas.com/v1/exercises?#{section}=#{option}"
#   infos = JSON.parse(RestClient.get(url, headers={'X-Api-Key' => KEY}))
#   infos.each do |data|
#     if Exercice.where(name: data["name"]).empty?
#       data = data.transform_keys(&:to_sym)
#       data.delete(:difficulty) if data.has_key?(:difficulty)
#       data[:nature] = data.delete :type if data.has_key?(:type)
#       exercice = Exercice.new(data)
#       exercice.user = USERS.sample
#       if exercice.save
#         new_exercices += 1
#         EXERCICES << exercice
#       end
#     end
#   end
#   puts "#{new_exercices} Exercices added from the API in section \"#{section}\" with option \"#{option}\"" unless new_exercices == 0
# end

# ITERATE ON VARIOUS OPTIONS OF THE API
# type_options = ["cardio", "olympic_weightlifting", "plyometrics", "powerlifting", "strength", "stretching", "strongman"]
# muscle_options = ["abdominals", "abductors", "biceps", "calves", "chest", "forearms", "glutes", "hamstrings", "lats", "lower_back", "middle_back", "neck", "quadriceps", "traps", "tricep"]

# muscle_options.each { |opt| query_new_exercices(opt, "muscle") }
# type_options.each { |opt| query_new_exercices(opt, "type") }

# puts "#{Exercice.count} Exercices currently in the database"

# USING API TO ADD EXERCICES TO THE CSV FILE
# CSV.open(csv_path, "wb", col_sep: '//') do |row|
#   row << header
#   Exercice.all.each do |exercice|
#     data = [
#       exercice[:name],
#       exercice[:nature],
#       exercice[:muscle],
#       exercice[:equipment],
#       exercice[:instructions]
#     ]
#     row << data
#   end
#   puts "#{Exercice.count} Exercices saved in CSV"
# end




# type_options = ["cardio", "olympic_weightlifting", "plyometrics", "powerlifting", "strength", "stretching", "strongman"]

# EXO A LA MANO
# Cloudinary::Uploader.upload("https://cdn.shopify.com/s/files/1/1633/7705/articles/kneeling_squat_2000x.jpg?v=1636617009")
USER = User.all
exo = Exercice.create!(
  user_id: USER.sample.id,
  name: "Kneeling Squat",
  nature: "strength",
  muscle: "quadriceps",
  equipment: "barbell",
  instructions: "Set the bar to the proper height in a power rack. Kneel behind the bar; it may be beneficial to put a mat down to pad your knees. Slide under the bar, racking it across the back of your shoulders. Your shoulder blades should be retracted and the bar tight across your back. Unrack the weight. With your head looking forward, sit back with your butt until you touch your calves. Reverse the motion, returning the torso to an upright position.",
  url_title: "https://cdn.shopify.com/s/files/1/1633/7705/articles/kneeling_squat_2000x.jpg?v=1636617009",
  url_content: "https://www.inspireusafoundation.org/wp-content/uploads/2021/12/how-to-do-a-kneeling-squat.gif"
  )

  exo.image.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open(exo.url_title)
)

exo.gif.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
  io: URI.open(exo.url_title)
  )

  exo = Exercice.create!(
    user_id: USER.sample.id,
    name: "Push up",
    nature: "strength",
    muscle: "chest",
    equipment: "body weight",
    instructions: "Lie on the floor face down and place your hands about 36 inches apart while holding your torso up at arms length. Next, lower yourself downward until your chest almost touches the floor as you inhale. Now breathe out and press your upper body back up to the starting position while squeezing your chest. After a brief pause at the top contracted position, you can begin to lower yourself downward again for as many repetitions as needed. Variations: If you are new at this exercise and do not have the strength to perform it, you can either bend your legs at the knees to take off resistance or perform the exercise against the wall instead of the floor. For the most advanced lifters, you can place your feet at a high surface such as a bench in order to increase the resistance and to target the upper chest more.",
  url_title: "https://img.sport.gentside.com/s3/frgss/1280/musculation/default_2021-05-17_5cc050de-9c60-450f-8cae-74140b2b8790.jpeg",
  url_content: "https://www.docteur-fitness.com/wp-content/uploads/2020/10/pompe-musculation.gif"
)

exo.image.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )

    exo = Exercice.create!(
      user_id: USER.sample.id,
      name: "Dumbbell Flyes",
      nature: "strength",
      muscle: "chest",
      equipment: "dumbells",
      instructions: "Lie down on a flat bench with a dumbbell on each hand resting on top of your thighs. The palms of your hand will be facing each other. Then using your thighs to help raise the dumbbells, lift the dumbbells one at a time so you can hold them in front of you at shoulder width with the palms of your hands facing each other. Raise the dumbbells up like you're pressing them, but stop and hold just before you lock out. This will be your starting position. With a slight bend on your elbows in order to prevent stress at the biceps tendon, lower your arms out at both sides in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, the arms should remain stationary; the movement should only occur at the shoulder joint. Return your arms back to the starting position as you squeeze your chest muscles and breathe out. Tip: Make sure to use the same arc of motion used to lower the weights. Hold for a second at the contracted position and repeat the movement for the prescribed amount of repetitions. Variations: You may want to use a palms facing forward version for different stimulation.",
      url_title: "https://th.bing.com/th/id/OIP.xQPZalQp-JeQcWEtA1GMhwHaFE?pid=ImgDet&rs=1",
      url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/09/ecartes-incline-avec-halteres.gif"
      )

      exo.image.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
)

exo.gif.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
  io: URI.open(exo.url_title)
  )

  exo = Exercice.create!(
    user_id: USER.sample.id,
    name: "Pullup",
    nature: "strength",
    muscle: "lats",
    equipment: "body weight",
    instructions: "Grab the pull-up bar with the palms facing forward using the prescribed grip. Note on grips: For a wide grip, your hands need to be spaced out at a distance wider than your shoulder width. For a medium grip, your hands need to be spaced out at a distance equal to your shoulder width and for a close grip at a distance smaller than your shoulder width. As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position. Pull your torso up until the bar touches your upper chest by drawing the shoulders and the upper arms down and back. Exhale as you perform this portion of the movement. Tip: Concentrate on squeezing the back muscles once you reach the full contracted position. The upper torso should remain stationary as it moves through space and only the arms should move. The forearms should do no other work other than hold the bar. After a second on the contracted position, start to inhale and slowly lower your torso back to the starting position when your arms are fully extended and the lats are fully stretched. Repeat this motion for the prescribed amount of repetitions. Variations: If you are new at this exercise and do not have the strength to perform it, use a chin assist machine if available. These machines use weight to help you push your bodyweight. Otherwise, a spotter holding your legs can help. On the other hand, more advanced lifters can add weight to the exercise by using a weight belt that allows the addition of weighted plates. The behind the neck variation is not recommended as it can be hard on the rotator cuff due to the hyperextension created by bringing the bar behind the neck.",
      url_title: "https://th.bing.com/th/id/OIP.OpC07TRxH_3pSKi1pnEDFAHaE7?pid=ImgDet&rs=1",
      url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/02/traction-musculation-dos.gif"
      )

      exo.image.attach(
        filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
        io: URI.open('https://api.lorem.space/image/face')
        )

exo.gif.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
  io: URI.open(exo.url_title)
)

exo = Exercice.create!(
  user_id: USER.sample.id,
  name: "Rope climb",
  nature: "cardio",
  muscle: "lats",
  equipment: "rope",
  instructions: "Grab the rope with both hands above your head. Pull down on the rope as you take a small jump. Wrap the rope around one leg, using your feet to pinch the rope. Reach up as high as possible with your arms, gripping the rope tightly. Release the rope from your feet as you pull yourself up with your arms, bringing your knees towards your chest. Resecure your feet on the rope, and then stand up to take another high hold on the rope. Continue until you reach the top of the rope. To lower yourself, loosen the grip of your feet on the rope as you slide down using a hand over hand motion.",
  url_title: "https://www.wateraid.org/uk/sites/g/files/jkxoof211/files/styles/wateraid_square_large/public/EVE31_001%20%2877%29.jpg?itok=bVwKmjF-",
  url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/10/montee-de-corde.gif"
  )

  exo.image.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
    io: URI.open('https://api.lorem.space/image/face')
    )

    exo.gif.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
  io: URI.open(exo.url_title)
  )

  exo = Exercice.create!(
    user_id: USER.sample.id,
    name: "EZ-bar spider curl",
  nature: "strength",
  muscle: "biceps",
  equipment: "EZ-bar",
  instructions: "Start out by setting the bar on the part of the preacher bench that you would normally sit on. Make sure to align the barbell properly so that it is balanced and will not fall off. Move to the front side of the preacher bench (the part where the arms usually lay) and position yourself to lay at a 45 degree slant with your torso and stomach pressed against the front side of the preacher bench. Make sure that your feet (especially the toes) are well positioned on the floor and place your upper arms on top of the pad located on the inside part of the preacher bench. Use your arms to grab the barbell with a supinated grip (palms facing up) at about shoulder width apart or slightly closer from each other. Slowly begin to lift the barbell upwards and exhale. Hold the contracted position for a second as you squeeze the biceps. Slowly begin to bring the barbell back to the starting position as your breathe in. . Repeat for the recommended amount of repetitions. Variation: You can also use dumbbells when performing this exercise. Just make sure you place the dumbbells on the part of the preacher bench where you would normally sit properly.",
  url_title: "https://th.bing.com/th/id/OIP.J9kon4zC7xN0i862cgbjLAAAAA?pid=ImgDet&rs=1",
  url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/01/spider-curl.gif"
  )

  exo.image.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )

    exo = Exercice.create!(
      user_id: USER.sample.id,
      name: "Hammer Curls",
      nature: "strength",
      muscle: "biceps",
      equipment: "dumbell",
      instructions: "Seat yourself on an incline bench with a dumbbell in each hand. You should pressed firmly against he back with your feet together. Allow the dumbbells to hang straight down at your side, holding them with a neutral grip. This will be your starting position. Initiate the movement by flexing at the elbow, attempting to keep the upper arm stationary. Continue to the top of the movement and pause, then slowly return to the start position.",
      url_title: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hammer-curls-1581441441.jpg?resize=980:*",
      url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/09/curl-haltere-prise-neutre.gif"
      )

exo.image.attach(
  filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )

    exo = Exercice.create!(
      user_id: USER.sample.id,
      name: "Triceps dip",
      nature: "cardio",
      muscle: "triceps",
      equipment: "parallel bar",
      instructions: "To get into the starting position, hold your body at arm's length with your arms nearly locked above the bars. Now, inhale and slowly lower yourself downward. Your torso should remain upright and your elbows should stay close to your body. This helps to better focus on tricep involvement. Lower yourself until there is a 90 degree angle formed between the upper arm and forearm. Then, exhale and push your torso back up using your triceps to bring your body back to the starting position. Repeat the movement for the prescribed amount of repetitions. Variations: If you are new at this exercise and do not have the strength to perform it, use a dip assist machine if available. These machines use weight to help you push your bodyweight. Otherwise, a spotter holding your legs can help. More advanced lifters can add weight to the exercise by using a weight belt that allows the addition of weighted plates.",
        url_title: "https://th.bing.com/th/id/R.c9910714d8b13e12678bd2e0269f91de?rik=sludO%2fS3fc5TjA&riu=http%3a%2f%2fwinstrol-profile.co.uk%2fwp-content%2fuploads%2f2021%2f07%2fparallel-bar-dips.jpg&ehk=oWq2WEwDs9PUJhYtIHCoFQhu1PAUvsT%2bKgm2QU4Mvcs%3d&risl=&pid=ImgRaw&r=0",
        url_content: "https://www.docteur-fitness.com/wp-content/uploads/2000/01/dips-pectoraux.gif"
        )

        exo.image.attach(
          filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
          io: URI.open('https://api.lorem.space/image/face')
          )

          exo.gif.attach(
            filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
            io: URI.open(exo.url_title)
            )

            exo = Exercice.create!(
              user_id: USER.sample.id,
              name: "Single-Leg Press",
              nature: "strongman",
              muscle: "quadriceps",
              equipment: "smith machine leg press",
              instructions: "Load the sled to an appropriate weight. Seat yourself on the machine, planting one foot on the platform in line with your hip. Your free foot can be placed on the ground. Maintain good spinal position with your head and chest up. Supporting the weight, fully extend the knee and unlock the sled. This will be your starting position. Lower the weight by flexing the hip and knee, continuing as far as flexibility allows. Do not allow your lumbar to take the load by moving your pelvis. At the bottom of the motion pause briefly and then return to the starting position by extending the hip and knee. Complete all repetitions for one leg before switching to the other.",
              url_title: "https://th.bing.com/th/id/R.a7c4d1cf18014debd4839bbe0110ba73?rik=2bkw6FXFrHilxQ&pid=ImgRaw&r=0",
              url_content: "https://www.inspireusafoundation.org/wp-content/uploads/2022/03/single-leg-leg-press.gif"
              )

              exo.image.attach(
                filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )

    exo = Exercice.create!(
      user_id: USER.sample.id,
      name: "Decline crunch",
      nature: "cardio",
      muscle: "abs",
      equipment: "incline bench",
      instructions: "Lie on your back on a decline bench and hold on to the top of the bench with both hands. Don't let your body slip down from this position. Hold your legs parallel to the floor using your abs to hold them there while keeping your knees and feet together. Tip: Your legs should be fully extended with a slight bend on the knee. This will be your starting position. While exhaling, move your legs towards the torso as you roll your pelvis backwards and you raise your hips off the bench. At the end of this movement your knees will be touching your chest. Hold the contraction for a second and move your legs back to the starting position while inhaling. Repeat for the recommended amount of repetitions. Variations: You can do the movement on a flat surface and as you get more advanced you can use ankle weights.",
        url_title: "https://www.muscleandfitness.com/wp-content/uploads/2018/10/abs-decline-crunch-1109.jpg?quality=86&strip=all",
        url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/02/sit-up-decline.gif"
        )

        exo.image.attach(
          filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
          io: URI.open('https://api.lorem.space/image/face')
          )

          exo.gif.attach(
            filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
            io: URI.open(exo.url_title)
            )

            exo = Exercice.create!(
              user_id: USER.sample.id,
              name: "Elbow plank",
              nature: "cardio",
              muscle: "abs",
              equipment: "body weight",
              instructions: "Get into a prone position on the floor, supporting your weight on your toes and your forearms. Your arms are bent and directly below the shoulder. Keep your body straight at all times, and hold this position as long as possible. To increase difficulty, an arm or leg can be raised.",
              url_title: "https://th.bing.com/th/id/OIP.lIcDasLLdudJ2iCqfDWtLgHaEK?pid=ImgDet&rs=1",
              url_content: "https://www.docteur-fitness.com/wp-content/uploads/2022/05/planche-abdos.gif"
              )

              exo.image.attach(
                filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )

exo = Exercice.create!(
  user_id: USER.sample.id,
  name: "Spider crawl",
  nature: "cardio",
  muscle: "abs",
  equipment: "body weight",
  instructions: "Begin in a prone position on the floor. Support your weight on your hands and toes, with your feet together and your body straight. Your arms should be bent to 90 degrees. This will be your starting position. Initiate the movement by raising one foot off of the ground. Externally rotate the leg and bring the knee toward your elbow, as far forward as possible. Return this leg to the starting position and repeat on the opposite side.",
  url_title: "https://th.bing.com/th/id/R.0ffa64254a271e51361c54f37d3ff4bf?rik=ore8M%2bXo1ivxCQ&pid=ImgRaw&r=0",
  url_content: "https://newlife.com.cy/wp-content/uploads/2019/11/07781301-Spider-Crawl-Push-up_Hips_360.gif"
  )

  exo.image.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.jpg",
  io: URI.open('https://api.lorem.space/image/face')
  )

  exo.gif.attach(
    filename: "#{exo.name.downcase.gsub(" ", "_")}.gif",
    io: URI.open(exo.url_title)
    )
    # GENERATING WORKOUTS AND WORKOUTS_SET
    number_of_workouts = 5
    number_of_workoutsets = rand(3..8)

    number_of_workouts.times do
      workout = Workout.new(
        name: "Train like #{Faker::JapaneseMedia::DragonBall.character}",
        description: "If you love challenge, this workout should pick your interest. It's beginner friendly and a great way to start your fitness journey !"
      )
      workout.user = USERS.sample
      workout.save
      number_of_workoutsets.times do
        workout_set = WorkoutSet.new(
          repetition: rand(6..16)
        )
        workout_set.workout = workout
        workout_set.exercice = EXERCICES.sample
        workout_set.save
      end
    end
    WORKOUTS = Workout.all
    puts "#{Workout.count} Workouts created"
    puts "#{WorkoutSet.count} WorkoutSets created"

    # GENERATING TRAININGS and SESSIONS
    number_of_trainings = rand(2..6)
    number_of_users = 5
    USERS.sample(number_of_users).each do |user|
      number_of_trainings.times do
        training = Training.new
        workout = WORKOUTS.sample
        training.user = user
        training.workout = workout
        if training.save
          session = Session.new(
            programing_at: Date.today + rand(1..100).day
          )
          session.training = training
          session.save
        end
      end
    end

    puts "#{Training.count} Trainings created"
    puts "#{Session.count} Sessions created"

    # RATINGS

    def rate
      rates = [
        rand(1..2),
        rand(3..4),
        rand(5..6),
        rand(7..8),
        rand(9..10)
      ]
      rate_picker = rand(0..(rates.size-1))
      rates[rate_picker]
    end


    users = User.all
    exercices = Exercice.all
    users.each do |user|
      exercices.each do |exercice|
        rating = Rating.new(
          user_id: user.id,
          exercice_id: exercice.id,
          muscular_effort: rate(),
          breath_difficulty: rate(),
          flexibility: rate()
        )
        rating.save
      end
    end
    puts "#{Rating.count} Ratings created"

    admin = User.create!(
      name: "admin",
      email: "admin@mail.com",
      password: "secret"
    )

    10.times do
      training = Training.new()
      training.user = admin
      training.workout = WORKOUTS.sample
      training.save
    end

    5.times do
      session = Session.new(
        programing_at: Date.today + rand(0..6).day
      )
      session.training = admin.trainings.sample
      session.save
    end

    puts "#{admin.sessions.size} Admin sessions"
