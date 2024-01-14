interface CategoriesProps {
    title: string;
    categories: { name: string }[];
}

const Categories = ({ title, categories }: CategoriesProps) => {
    const categoryNames = categories
        .map((category) => category.name)
        .join(", ");

    return (
        <div className="group">
            <span className="text-sm font-semibold text-gray-400">{title}</span>
            <div className="flex ">
                <h5>{categoryNames}</h5>
            </div>
        </div>
    );
};

export default Categories;
