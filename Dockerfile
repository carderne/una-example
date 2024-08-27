FROM python
COPY dist dist
RUN pip install dist/*.whl
