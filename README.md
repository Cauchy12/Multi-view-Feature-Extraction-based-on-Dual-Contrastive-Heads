# Multi-view-Feature-Extraction-based-on-Dual-Contrastive-Heads
"This program is designed by Hongjie Zhang."

run.m: This is a script program that serves as the entry point for running the algorithm.
X: Represents the sample matrix.
Y: Denotes the label vector associated with the samples.
R: A randomly selected training sample indicator matrix.
D: The dimension of the extracted features.
parameter.m: This is the main function that drives the core logic of the program.

five_fold.m:
This script performs five-fold cross-validation, splitting the dataset into training and testing sets in a way that each subset is used for testing exactly once. This helps evaluate the model's performance across different data partitions.

qiudao.m:
This function computes the gradient of the projection matrix (P_m) for optimization purposes. It is likely used during the iterative updates of the projection matrix.

qiudao_w.m:
This function computes the gradient of the similarity matrix (W_m) for optimization. It helps refine the similarity matrix during iterations.

CLCCA.m:
This function uses the Adam optimizer to calculate and update the projection matrix (P_m). Adam is an adaptive gradient-based optimization algorithm known for its efficiency and robustness.

jisuanW.m:
This function employs the Adam optimizer to compute and update the similarity matrix (W_m). This ensures the similarity matrix converges optimally during the iterative process.
Iterative Process:

During each iteration, the program updates:
W_m: The similarity matrix.
P_m: The projection matrix.
The updates are performed iteratively to optimize the feature extraction process and achieve convergence.
