FROM continuumio/miniconda3

EXPOSE 80

EXPOSE 443 

RUN mkdir actions-runner; cd actions-runner && \
    apt-get update && apt-get install -y curl

WORKDIR /actions-runner

RUN curl -O -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz && \
    ./bin/installdependencies.sh && \
    useradd -m runneruser && \
    chown -R runneruser:runneruser /actions-runner

USER runneruser

RUN  ./config.sh --url https://github.com/Annika1712/maven-java-sample --token AO7CVWFYGBTCXQHZRM6AJRDGQPQ32 --unattended --replace --name runner-annika --labels runner-annika

USER runneruser

RUN chmod +x /actions-runner/run.sh

ENTRYPOINT ["/actions-runner/run.sh"]