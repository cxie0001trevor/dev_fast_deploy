FROM jupyter/minimal-notebook

COPY ./Pipfile /Pipfile
COPY ./Pipfile.lock /Pipfile.lock

RUN pip install pipenv -i https://mirrors.aliyun.com/pypi/simple/
RUN pipenv install --deploy --system
