# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{name: 'Juan Pablo', lastname: 'Sandóval Alcocer', professional_degree: 'Dr.', role: 'docente', email: 'sandoval@ucb.edu.bo', career: 'Ingeniería de Sistemas', password: '.sandoval.', username: 'sandoval', admin_role: true},
             {name: 'Yanina', lastname: 'Galaburda', professional_degree: 'Mgr.', role: 'director', email: 'yanina@ucb.edu.bo', career: 'Ingeniería de Sistemas', password: 'galaburda', username: 'yanina'},
             {name: 'Tatiana', lastname: 'Aparicio', professional_degree: 'Mgr.', role: 'docente', email: 'aparicio@ucb.edu.bo', career: 'Ingeniería de Sistemas', password: 'aparicio', username: 'tatiana'},
             {name: 'Ismael', lastname: 'Delgado', professional_degree: 'Mgr.', role: 'docente', email: 'ismael@delgado.com', career: 'Ingeniería de Sistemas', password: 'delgado', username: 'ismael'},
             {name: 'Wendoline', lastname: 'Arteaga', professional_degree: 'Mgr.', role: 'docente', email: 'wendo@arteaga.com', career: 'Ingeniería de Sistemas', password: 'arteaga', username: 'wendo'},
             {name: 'Lesly', lastname: 'Méndez Cruz', role: 'estudiante', email: 'mendez@gmail.com', career: 'Ingeniería de Sistemas', password: 'mendez', username: 'lesmendezc'},
             {name: 'Estela', lastname: 'Herbas', professional_degree: 'Mgr.', role: 'director', email: 'estela@herbas.com', career: 'Ingeniería Ambiental', password: 'herbas', username: 'estela'}])

event = Event.create({name: 'Primera Revisión Perfil', year: '2019', semester: 'Primer', career: 'Ingeniería de Sistemas', limit_date: Date.new(2019,01,31)})