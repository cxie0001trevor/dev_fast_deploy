FROM jupyter/minimal-notebook

COPY ./Pipfile /Pipfile
COPY ./Pipfile.lock /Pipfile.lock

RUN pip install pipenv
RUN pipenv install --deploy --system
