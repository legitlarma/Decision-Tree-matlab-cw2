function [tree] = classificationTree
[features, labels] = load_classification_data;
tree = DecisionTreeLearning(features, labels);