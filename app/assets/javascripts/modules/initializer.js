modulejs.define('initializer', function(){
	$('[data-module]').each(function() {
		modulejs.require($(this).data('module')).init();
	});
});
