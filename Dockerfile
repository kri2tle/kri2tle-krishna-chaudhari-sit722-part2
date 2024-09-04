FROM python:3.11-alpine

#Specify the working directory within the container.
WORKDIR /app/

# Transfer the `requirements.txt` file into the container.
COPY book_catalog/requirements.txt .

# Install all necessary packages listed in `requirements.txt`.
RUN pip install --no-cache-dir -r requirements.txt

# Transfer the contents of the current directory into the container at `/app`.
COPY book_catalog/ .

# Execute the FastAPI application using Uvicorn.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]