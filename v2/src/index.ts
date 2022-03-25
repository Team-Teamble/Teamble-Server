import express, { Request, Response, NextFunction } from 'express';

const app = express();

app.get('/welcome', (req: Request, res: Response, next: NextFunction) => {
  res.send('welcome!!');
});

app.listen('5005', () => {
  console.log(`
  #######################################
  💜     teamble server - version2    💜
  💜  Server listening on port: 5005  💜
  #######################################
`);
});
