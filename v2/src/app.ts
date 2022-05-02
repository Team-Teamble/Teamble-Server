import express, { ErrorRequestHandler } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import printer from './lib/printer';
import routes from './routes';
import swaggerUi from 'swagger-ui-express';
import YAML from 'yamljs';
import path from 'path';

interface ServerError {
  code: string;
}

interface AppConfig {
  baseURL: string;
  port: number;
}

export async function createApp(config: AppConfig) {
  const app = express();
  // const db = new LocalStorageRepository('data/db');
  const swaggerSpec = YAML.load(path.join(__dirname, '../build/swagger.yaml'));
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

  app.use(morgan('dev'));
  app.use(cors());

  app.use(express.json());

  app.use(routes);

  app.use('*', (req, res) => {
    res.status(404).json({ message: '올바르지 않은 경로입니다.' });
  });
  app.use(defaultErrorHandler());

  function start() {
    printer.info('#######################################');
    printer.info('💜     teamble server - version2    💜');
    printer.info('#######################################');

    app
      .listen(config.port, () => {
        printer.info(`서버를 시작했습니다. [${config.baseURL}]`);
      })
      .on('error', (err: ServerError) => {
        if (err.code === 'EADDRINUSE') {
          printer.error(`서버 시작에 실패했습니다. ${config.port}번 포트를 다른 프로그램이 사용중입니다.`);
        } else {
          printer.error(err);
        }
      });
  }

  return {
    start,
  };
}

function defaultErrorHandler(): ErrorRequestHandler {
  return (err, req, res, next) => {
    res.status(500).json({ message: err.toString() });
    throw err;
  };
}
