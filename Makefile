setup: venv docker-up

.PHONY: venv
venv: 
	@echo "Setting up Python virtual environment..."
	python -m venv venv
	. venv/bin/activate && pip install -U pip && pip install -r requirements.txt

docker-up:
	@echo "Starting Docker containers..."
	docker compose up -d

docker-down:
	@echo "Stopping Docker containers..."
	docker compose down