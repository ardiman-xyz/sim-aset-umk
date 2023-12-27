import Logo from "./Logo";
import SidebarRoutes from "./SidebarRoutes";

const Sidebar = () => {
    return (
        <div className="h-full border-r border-gray-100 flex flex-col overflow-y-auto bg-white">
            <div className="p-6">
                <Logo />
            </div>
            <div className="flex flex-col w-full h-full overflow-y-auto relative">
                <SidebarRoutes />
            </div>
        </div>
    );
};

export default Sidebar;
