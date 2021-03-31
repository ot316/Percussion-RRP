from sklearn import tree
import graphviz
import pandas as pd
import matplotlib.pyplot as plt

max_depth = 5
label = "Sample Depth"

def main():
    df = pd.read_csv("../5-GMM-Dataset-0.05-scaled-full-random-state.csv", index_col=0)
    y = df[label]
    X = df[list(df.columns[:-3])]
    dt = tree.DecisionTreeClassifier(criterion='entropy', max_depth=5)
    dt.fit(X, y)

    fig = plt.figure(figsize=(25,20))
    _ = tree.plot_tree(dt, 
                   feature_names=list(df.columns[:-3]),  
                   class_names=["10", "15", "20", "25", "30"], # ["A", "B", "C"] # ["Li", "Fl"]
                   filled=True)

    plt.show()
    fig.savefig(f"../decision_tree_{label}_max_depth_{max_depth}.png")

if __name__ == '__main__':
    main()