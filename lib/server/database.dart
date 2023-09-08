import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> createConnection() async {
  final connection = PostgreSQLConnection(
    'your_host',
    5432, // PostgreSQL port
    'your_database_name',
    username: 'your_username',
    password: 'your_password',
  );

  await connection.open();

  return connection;
}
