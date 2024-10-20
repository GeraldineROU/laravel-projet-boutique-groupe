@extends('layout')
@section('content')

    <div class="container my-5">

            <h1>{{ $homeTitle }}</h1>

                <img src="{{ asset('images/basket.png') }}" alt="Panier de fruits et légumes" class="img-fluid rounded my-4 custom-img">




        <p class="lead">
            Bienvenue sur <strong>Notre Boutique de Fruits et Légumes Frais</strong>, où nous vous proposons une sélection de produits
            de qualité, directement issus de nos producteurs locaux. Nous croyons en la fraîcheur, la saisonnalité et la durabilité,
            et chaque fruit ou légume que vous achetez ici est soigneusement sélectionné pour offrir le meilleur goût possible.
        </p>

        <p>
            Chez nous, c'est facile de faire vos courses tout en soutenant l'agriculture locale. Vous pouvez parcourir nos catégories
            de produits pour découvrir une variété de fruits et légumes, tous frais, bio et cultivés de manière responsable. Nos paniers
            sont composés avec amour et sont idéaux pour les familles, les couples, ou même les personnes seules souhaitant manger plus
            sainement et soutenir une agriculture respectueuse de l'environnement.
        </p>

        <p>
            Nous avons également des offres spéciales chaque semaine pour vous permettre de découvrir de nouveaux produits
            et faire des économies sur vos achats. Nos livraisons sont rapides et flexibles, avec des créneaux horaires qui s’adaptent
            à votre emploi du temps chargé.
        </p>

        <p class="text-center">
            <a href="{{url("/product")}}" class="btn custom-button">Découvrir la boutique</a>
        </p>
    </div>


    </div>
@endsection
