package ufront.ufadmin.modules;

import ufront.ufadmin.UFAdminModule;

class DBAdminModule extends UFAdminModule
{
	public function new() {
		super( "db", "Database Admin" );
	}

	public function checkPermissions() {
		return true; // Set up more fine grained permissions later...
	}

	@:route("/*")
	public function doDefault() {
		#if server
			if ( sys.db.Manager.cnx==null ) {
				return 'No Database Connection Found';
			}
			else {
				spadm.AdminStyle.BASE_URL = baseUri;
				ufront.spadm.DBAdmin.handler(baseUri);
				context.completion.set( CRequestHandlersComplete );
				context.completion.set( CFlushComplete );
				return null;
			}
		#elseif
			return 'DBAdminModule is not available on the client';
		#end
	}
}
