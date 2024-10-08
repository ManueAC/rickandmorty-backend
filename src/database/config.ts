import { registerAs } from '@nestjs/config';

export default registerAs('config', () => {
  return {
    database: {
      name: process.env.DATABASE_NAME,
      port: process.env.DATABASE_PORT,
    },
    postgres: {
      url: process.env.DATABASE_URL,
      user: process.env.POSTGRES_INITDB_ROOT_USERNAME,
      password: process.env.POSTGRES_INITDB_ROOT_PASSWORD,
      host: process.env.POSTGRES_HOST,
      port: parseInt(process.env.POSTGRES_PORT, 10),
      dbName: process.env.POSTGRES_DB,
      connection: process.env.POSTGRES_CONNECTION,
      schema: process.env.POSTGRES_SCHEMA,
    },
    apiKey: process.env.API_KEY,
  };
});
