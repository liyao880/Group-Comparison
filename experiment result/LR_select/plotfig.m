
plot(batch,accuracy);
set(gca,'Fontsize',20,'FontWeight','bold')
title('Prediction Accuracy vs Pair Amount');
xlabel('Batch');
ylabel('Accuracy');

print -dpng tmp.png