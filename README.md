# README

<h1 align="center">
  <br>

<img src="app/assets/images/dreamdriver.png" alt="logo" width="200">
  <br>
DriveDreamer <br>

## Présentation 

Drive Dreamer est une platerforme qui vous aidera à planifier vos Roadtrips. Grâce à des fonctionnalités clefs, tel que la planification de votre temps, mais aussi des dépenses. Vous serez en mesure d'organiser votre voyage temps revé !

Mais ce n'est pas tout, la plateforme vous proposera suivant vos haltes, des restaurants / activités / animations au alentours afin de vous donner toujours plus de souvenirs à créer.

Avec des ajouts comme la possibilité de partager vos trajets, bons plans que vous aurez découvert. Mais aussi avoir votre propres page "Carnet de bord", plus rien ne vous retiendra pour rendre se roadtrip inoubliable !

## Le parcour utilisateur

- Page d'acceuil, vu sur une carte afin de pouvoir directement passer a l'action de créer son roadtrip, mais aussi visionner des Roadtrips prévu par d'autres utilisateurs afin d'avoir des idées.
- Une page Itinéraire afin d'afiner son Roadtrip avec des propositions d'activités, et la possibilité de filtrer en fonction du temps de trajets, ou attractions, hébergements.
- Une page préparation du voyage, avec des conseils et check up a faire avant le depart. Pour partir en toute sérénité.
- Une page communauté et partage, une partie blog pour retrouver les Roadstrips des autres utilisateurs. Mais aussi votre propres page classée chronologiquement et géolocalisé afin de partager vous aussi votre experience !




## Concrètement

Mise en place du projet ici 👉 [DriveDreamer](https://trello.com/b/tRLo4hEg/dreamdrivewr)

3.1. Base de données
* Base de données en PostgreSQL
* Users, Itinéraire, Activités, commentaires
* ActiveStorage

3.2. Front
* Integration Figma  👉 [DriveDreamer](https://www.figma.com/file/XUXQyeuS33qOsbvH51gR29/DriveDreamer?type=design&node-id=62-7&mode=design&t=ye6cVb1yoqf4vTfE-0)

3.3. Backend
* Gestion Users
* Active Storage pour les images / photos
* Créations d'itinaires
* Ajout de commentaires

3.4. Besoins techniques
* Apprentissage de l'integration de differentes API tels que Google pour Maps.
* Contact avec Mappy pour l'utilisation de leur API




## WEB version 🌐

Le site est en live ici 👉 [DriveDreamer](https://drivedreamer.fly.dev/)

## Installation en local ⚙️

Utilisez la commande suivante avant de lancer le programme

```ruby 
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

## Lancer le programme 🚦

Il ne vous reste plus qu'à tester l'ensemble des fonctionnalités de l'application passer commande, voir les orders, etc.. !

```ruby
$ rails server
```
 Si vous avez un problème avec Postgresql:

 ```ruby
$ sudo service postgresql start
```

Rendez-vous ensuite sur le site en local 👉 [DriveDreamer](http://localhost:3000/)


## Supprimer la BDD et la relancer 🚦

Relance la base de données pour de nouveaux items !

```ruby
$ rails db:reset
$ rails db:migrate
$ rails db:seed
```

Rendez-vous ensuite sur le site en local 👉 [DriveDreamer](http://localhost:3000/)



## Crédit 🔗

[Winny Drancourt](https://github.com/WinnyDrancourt)<br>
[Shaun Chowthee](https://github.com/ShaunChowthee)<br>
[Alexia Cabanel](https://github.com/alexiacabanel)<br>
[Pierre Tarian](https://github.com/PierreTarian)<br>
