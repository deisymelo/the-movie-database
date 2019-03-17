# The Movie DB
The Movie DB es un proyecto desarrollado en Swift, para iPhone. Lista las péliculas más populares 
obtenidas del api https://developers.themoviedb.org/3.

# Configuración
Se implementa el patrón de diseño MVVM y RxSwift. 
Se sigue el principio de reutilización al crear vistas independientes para las celdas de cada CollectionView.
Se usan extensiones para crear styles para textos y UIViews.
Se usa Kingfisher para la carga de imágenes desde una URL.

Cuando se selecciona cada una de las películas, se llama la vista que contiene el detalle de la película seleccionada.
La información no se vuelve a consultar, ya que se envía desde la vista principal a la del detalle.

Con la información recibida de la vista principal, se muestra la imagen del backdrop y del poster, así como el nombre, el año,
el overview y la votación del público.


Para mostrar los actores que participaron en la película se hace una consulta al API. 
La información obtenida se muestra en un CollectionView con scroll horizontal.

Para mostrar los géneros de las películas, se consulta al API y el resultado de dicha consulta se almacena en la 
base de datos del dispositivo usando CoreData. Ésto con el fin de realizar la consulta al API sólo una vez.
