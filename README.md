# Can GNNs with Unique Identifiers learn to be permutation-invariant?

---

## Installation

### 1. Clone the Repository
Clone this repository to your local machine:
```bash
git clone https://github.com/dorsimantov/gnn-permutation-invariance.git
cd gnn-permutation-invariance
```

### 2. Install Required Dependencies
This project relies on the `k-gnn` library and additional Python packages specified in the `environment.yaml` file.
- **Install `k-gnn`**:
  Install the `k-gnn` library from its official GitHub repository:
     ```bash
    git clone https://github.com/chrsmrrs/k-gnn/
    cd k-gnn
    pip install .
    cd ..
     ```
- **Create and Activate Conda Environment**:
  ```bash
  conda env create -f environment.yaml
  conda activate gnn-permutation-invariance
  ```

---

## Repository Structure

### 1. `run.sh`
- **Purpose**: Automates running experiments by setting hyperparameters and executing `train_and_eval.py` with the chosen configurations.
- **How to Use**:
  1. Edit the hyperparameters directly in the script or use the provided loops for automated exploration.
  2. Run the script using:
     ```bash
     bash run.sh
     ```
  3. The script will train and evaluate models for all different values of hyperparameters (varying one hyperparameters and fixing the others to their default values) and save results as `.csv` files in the `results/` directory.

---

### 2. `train_and_eval.py`
- **Purpose**: Trains the model and evaluates its performance on the specified dataset.
- **Functionality**:
  - Trains a model for the given hyperparameters.
  - Evaluates the model on both training and test sets.
  - Saves the evaluation metrics in the `results/` directory as `.csv` files.

---

### 3. `save_figures.py`
- **Purpose**: Generates plots analyzing the effect of each hyperparameter on the performance of individual models.
- **Functionality**:
  - Creates plots that show the effect of a specific hyperparameter on a particular metric for each model and dataset.
  - Saves the plots in the `figures/` directory as `.svg` files.
- **How to Use**:
     ```bash
     python3 save_figures.py
     ```
  
---

### 4. `compare_models.py`
- **Purpose**: Compares the performance of different models under fixed hyperparameter configurations.
- **Functionality**:
  - Produces plots showing how a specific metric varies across models for the same dataset and fixed hyperparameters.
  - Saves the plots in the `figures/` directory as `.svg` files.
- **How to Use**:
     ```bash
     python3 compare_models.py
     ```