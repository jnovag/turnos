$(document).on('page:change', function(){
	$.getJSON("/dashboard/distribucion_agencia.json", function(data){
		Morris.Donut({
			element: 'distribucion-agencia',
			data: data,
			colors: ['#256c3c', '#a2673a', '#286469']
		});
	});

	$.getJSON("/dashboard/distribucion_estado.json", function(data){
		Morris.Donut({
			element: 'distribucion-estado',
			data: data,
			colors: ['#256c3c', '#a2673a', '#286469']
		});
	});

	$.getJSON("/dashboard/promedio_espera.json", function(data){
		Morris.Line({
			element: 'promedio-espera',
			data: data,
			xkey: 'day',
			ykeys: ['value'],
			labels: ['Promedio']
		});
	});

	$.getJSON("/dashboard/promedio_atencion.json", function(data){
		Morris.Line({
			element: 'promedio-atencion',
			data: data,
			xkey: 'day',
			ykeys: ['value'],
			labels: ['Promedio']
		});
	});

});
