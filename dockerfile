FROM python:3.9
ADD main.py requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 3000
CMD [ "python", "main.py" ]