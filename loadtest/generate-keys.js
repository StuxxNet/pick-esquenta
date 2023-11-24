import http from 'k6/http';
import {
  check,
  sleep
} from 'k6';

export const options = {
  scenarios: {
    quantidade_fixa: {
      executor: 'per-vu-iterations',
      vus: 100,
      iterations: 10,
      maxDuration: '1m',
    },
    ramapando_ate_100: {
      executor: 'ramping-vus',
      startVUs: 0,
      stages: [{
          duration: '30s',
          target: 50
        },
        {
          duration: '1m00s',
          target: 100
        },
      ],
      gracefulRampDown: '60s',
    },
  },
};

export default function() {
  gerarSenha()
  buscarSenha()
}

const gerarSenha = () => {
  const url = 'http://giropops-senhas.kubernetes.docker.internal/api/gerar-senha';

  const payload = JSON.stringify({
    tamanho: 32,
    incluir_numeros: "on",
    incluir_caracteres_especiais: "on"
  });

  const params = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  const res = http.post(url, payload, params);

  check(res, {
    'criarSenhas - HTTP 200': (r) => r.status === 200
  });
  sleep(1);
}

const buscarSenha = () => {
  const url = 'http://giropops-senhas.kubernetes.docker.internal/api/senhas';

  const params = {
    headers: {
      'Content-Type': 'application/json',
    },
  };

  const res = http.get(url, params);

  check(res, {
    'buscarSenhas - HTTP 200': (r) => r.status === 200
  });
  sleep(1);
}