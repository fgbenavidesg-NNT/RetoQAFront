function fn() {
  var env = karate.env;

  function generarEmail(){
    return "holaMundo" + Math.floor(Math.random() * 100000) + '@qa.com';
  };
  
  if (!env) {
    env = 'integracion';
  }
  var config = {
  }
  if (env == 'integracion') {
    config.urlBase='https://serverest.dev/';
    config.emailGenerado=generarEmail();
  } 
  if (env == 'certificacion') {
	}
	if (env == 'produccion') {
	}
  karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	karate.configure('logPrettyRequest', true);
	karate.configure('logPrettyResponse', true);
  return config;
}