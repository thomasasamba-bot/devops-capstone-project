.PHONY: setup test train deploy clean

setup:
	pip install -r src/requirements.txt
	docker-compose up -d

test:
	pytest tests/ --cov=src --cov-report=term-missing

train:
	python src/ml/train.py --data data/user_behavior.csv

deploy:
	cd infrastructure/terraform && terraform apply -auto-approve
	cd infrastructure/kubernetes && kubectl apply -f deployment.yaml

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	rm -rf .pytest_cache/ .coverage coverage.xml
