FROM python:3.7

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install -U pip
RUN pip install dbt==0.16.0

# Set environment variables
ENV DBT_DIR /github/workspace

# Set working directory
WORKDIR $DBT_DIR

# Run dbt
CMD ["dbt", "run", "--profiles-dir", "./"]
