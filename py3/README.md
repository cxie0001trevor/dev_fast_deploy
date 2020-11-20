# 快捷部署`jupyter notebook`

### Image Base: `jupyter/minimal-notebook`

Jupyter-docker-stacks: https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#core-stacks

### Dockerfile

```dockerfile
FROM jupyter/minimal-notebook

COPY ./Pipfile /Pipfile
COPY ./Pipfile.lock /Pipfile.lock

RUN pip install pipenv
RUN pipenv install --deploy --system
```

### Start/Restart

```
$ ./deploy.sh
```





### 注意事项

* `Pipfile`有任何包版本的改动，或新增包，都需重新构建`Pipfile.lock`。

* `Pipfile`与`Pipfile.lock`需同时存在，否则[报错](https://github.com/pypa/pipenv/issues/2183#issuecomment-388567105)

```
Step 4/4 : RUN pipenv install --deploy --system
[PipenvOptionsError]: ...(ommitted)
Warning: --system is intended to be used for Pipfile installation, not installation of specific packages. Aborting.
See also: --deploy flag.
```

